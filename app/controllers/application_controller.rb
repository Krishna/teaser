class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_abingo_identity

  def set_abingo_identity    
    if (request.user_agent =~ /\b(Baidu|Gigabot|Googlebot|libwww-perl|lwp-trivial|msnbot|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg)\b/i)
      # This prevents robots from occupying more than 1 participant slot in A/B tests.
      Abingo.identity = "robot"
    elsif (session[:abingo_identity])
      Abingo.identity = session[:abingo_identity]
    else
      session[:abingo_identity] = Abingo.identity = rand(10 ** 10).to_i
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|

      actual_username = ENV['ADMIN_USERNAME'] || "username"
      actual_password = ENV['ADMIN_PASSWORD'] || "password"

      username == actual_username && password == actual_password
    end
  end

end
