class ApplicationController < ActionController::Base
<<<<<<< 5681325a399321d17f8483a05dd7cef43515f429
=======
  include ApplicationHelper
>>>>>>> rebase

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  protected

  
end
