class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_user!, except: [:index]

  protect_from_forgery with: :exception

end
