class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)    # Not the final implementation!
    if @user.save      # Handle a successful save.
       log_in @user
       flash[:success] = "Welcome!"
       redirect_to @user
    else
       render 'new'
    end
  end

  private

    def create_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
