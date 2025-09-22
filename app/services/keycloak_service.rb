require "net/http"
require "uri"
require "json"

class KeycloakService < ApplicationRecord
    def get_token(code)
        token_uri = URI("http://localhost:8080/realms/myrealm/protocol/openid-connect/token")

        response = Net::HTTP.post_form(token_uri, {
        grant_type: "authorization_code",
        code: code,
        redirect_uri: "http://localhost:3000/auth/callback",
        client_id: "myclient",
        client_secret: "G0H9Yz2N6xjlP4prbs1CqPkc0wOPw2Y7",
        })
        
        JSON.parse(response.body)
    end

    def get_user_info(access_token)
        user_info_uri = URI("http://localhost:8080/realms/myrealm/protocol/openid-connect/userinfo")

        request = Net::HTTP::Get.new(user_info_uri)
        request["Authorization"] = "Bearer #{access_token}"

        http = Net::HTTP.start(user_info_uri.host, user_info_uri.port, use_ssl: false)
        response = http.request(request)
        
        JSON.parse(response.body)
    end

    def keycloak_logout(refresh_token)
        logout_uri = URI("http://localhost:8080/realms/myrealm/protocol/openid-connect/logout")

        logout_request = Net::HTTP::Post.new(logout_uri)
        logout_request.set_form_data(
        "client_id" => "myclient",
        "client_secret" => "G0H9Yz2N6xjlP4prbs1CqPkc0wOPw2Y7",
        "refresh_token" => refresh_token,
        )

        http = Net::HTTP.start(logout_uri.host, logout_uri.port, use_ssl: false)
        response = http.request(logout_request)
    end
end
