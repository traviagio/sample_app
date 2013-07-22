class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

 def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to our Subscription based language travel club that allows members to travel to 50+ locations and learn French, Spanish, Italian and Mandarin at their convenience."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end