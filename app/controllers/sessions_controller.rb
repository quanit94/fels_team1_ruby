class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      respond_to do |f|
        f.html do 
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          remember user
          redirect_to user
        end
        f.json {
          render json: {
            error: false, 
            user: {id: user.id, name: user.name, email: user.email}
          }, 
          status: :ok
        }
      end

    else
      respond_to do |f|
        f.html do
     	    flash[:danger] = 'Invalid email/password combination' # Not quite right!
      	  render 'new'
        end
        f.json {render json: {error: true, message: "Invalid email/password combination"}, status: 401}
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
