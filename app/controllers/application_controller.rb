class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      actual_password = ENV['ADMIN_PASSWORD'] || "password"
      actual_username = ENV['ADMIN_USERNAME'] || "username"
      username == "username" && password == "password"
    end
  end

end
