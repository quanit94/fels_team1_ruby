class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  # before_action :set_user

  # skip_before_action :require_login, only: :update

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        respond_to do |f|
          f.html {redirect_to root_url}
          f.json {render json: {error: false, user: {id: @user.id, name: @user.name, email: @user.email}}, status: :ok}
        end
        
    else
        respond_to do |f|
          f.html do
            flash[:info] = @user.errors.full_messages
            render 'new'
          end
          f.json {render json: {error: true, message: @user.errors.full_messages}, status: 401}
        end
      
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url, notice: 'User was successfully updated.' }
        format.json { render json: {error: false, user: @user},  status: :ok}
      else
        format.html { render :edit }
        format.json { render json: {error: false, user: @user.errors}, status: :unprocessable_entity }
      end
    end
  end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end	

end

