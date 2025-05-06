class SessionsController < ApplicationController
  before_action :set_keycloak_service

  def login
    redirect_to "http://localhost:8080/realms/myrealm/protocol/openid-connect/auth?client_id=myclient&response_type=code&scope=openid&redirect_uri=http://localhost:3000/auth/callback"
  end

  def callback
    code = params[:code]
    
    token = @keycloak_service.get_token(code)
    access_token = token["access_token"]
    refresh_token = token["refresh_token"]
    
    user_info = @keycloak_service.get_user_info(access_token)
    
    session[:refresh_token] = 
    session[:user_info] = user_info

    redirect_to root_path
  end

  def logout
    refresh_token = session[:refresh_token]
    
    @keycloak_service.keycloak_logout(refresh_token)

    reset_session
    redirect_to root_path
  end

  private

  def set_keycloak_service
    @keycloak_service = KeycloakService.new
  end
end
