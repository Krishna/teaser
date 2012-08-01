class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|

      actual_username = ENV['ADMIN_USERNAME'] || "username"
      actual_password = ENV['ADMIN_PASSWORD'] || "password"

      username == actual_username && password == actual_password
    end
  end

end
