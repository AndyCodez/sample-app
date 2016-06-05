class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#Log in the user and redirect to the user's show page
      log_in user
      redirect_to user
  	else
  		flash.now[:danger] = 'Invalid email/password combo'#Not quite right
	  	render 'new'
	end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
