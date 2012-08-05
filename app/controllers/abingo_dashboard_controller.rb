class AbingoDashboardController < ApplicationController
  # Declare any before_filters or similar which you need to use your authentication
  # for this controller.
  before_filter :authenticate

  include Abingo::Controller::Dashboard

  
end
