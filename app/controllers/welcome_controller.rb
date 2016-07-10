class WelcomeController < ApplicationController
  
  def index
    unless !!current_user
      render 'index', layout: false
    else
      redirect_to user_path(current_user)
    end
  end

  

end
