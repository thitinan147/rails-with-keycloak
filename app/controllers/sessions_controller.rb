require "net/http"
require "uri"
require "json"

class SessionsController < ApplicationController
  def login
    browser_keycloak_host = "localhost"
    keycloak_url = "http://#{browser_keycloak_host}:8080/realms/myrealm/protocol/openid-connect/auth"
    client_id = "myclient"
    redirect_uri = "http://localhost:3000/auth/callback"
    state = SecureRandom.hex(16)

    scope = "openid profile email"

    redirect_to "#{keycloak_url}?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}&state=#{state}&scope=#{CGI.escape(scope)}", allow_other_host: true
  end

  def callback
    if params[:error]
      render plain: "Error: #{params[:error_description]}"
      return
    end

    code = params[:code]
    keycloak_host = "localhost"
    token_uri = URI("http://#{keycloak_host}:8080/realms/myrealm/protocol/openid-connect/token")

    response = Net::HTTP.post_form(token_uri, {
      grant_type: "authorization_code",
      code: code,
      redirect_uri: "http://localhost:3000/auth/callback",
      client_id: "myclient",
      client_secret: "hQ5xv4TPvqeeht4K4e2zyxv40hNJ8dmb",
    })

    token_data = JSON.parse(response.body)
    # Rails.logger.info "token_data: #{token_data.inspect}"
    access_token = token_data["access_token"]
    refresh_token = token_data["refresh_token"]
    session[:refresh_token] = refresh_token

    keycloak_host = "localhost"
    userinfo_uri = URI("http://#{keycloak_host}:8080/realms/myrealm/protocol/openid-connect/userinfo")

    request = Net::HTTP::Get.new(userinfo_uri)
    request["Authorization"] = "Bearer #{access_token}"

    http = Net::HTTP.start(userinfo_uri.host, userinfo_uri.port, use_ssl: false)
    response1 = http.request(request)
    Rails.logger.info "userinfo: #{response1}"

    if response1.code != "200"
      Rails.logger.error "UserInfo Error: #{response1.code} - #{response1.body}"
      # ยังคงไปหน้า root แต่ไม่มีข้อมูลผู้ใช้
    else
      session[:user_data] = JSON.parse(response1.body)
    end

    redirect_to root_path
  end

  def logout
    refresh_token = session[:refresh_token]
    # Rails.logger.info "refresh_token1111: #{refresh_token}"

    if refresh_token.present?
      keycloak_host = "localhost"
      logout_uri = URI("http://#{keycloak_host}:8080/realms/myrealm/protocol/openid-connect/logout")

      logout_request = Net::HTTP::Post.new(logout_uri)
      logout_request.set_form_data(
        "client_id" => "myclient",
        "client_secret" => "hQ5xv4TPvqeeht4K4e2zyxv40hNJ8dmb",
        "refresh_token" => refresh_token,
      )

      http = Net::HTTP.start(logout_uri.host, logout_uri.port, use_ssl: false)
      response = http.request(logout_request)

      # Rails.logger.info "Logout response code: #{response.code}"
      # Rails.logger.info "Logout response body: #{response.body}"
    else
      # Rails.logger.info "ไม่พบ refresh token ในเซสชัน"
    end

    reset_session
    redirect_to root_path
  end
end
