class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  # before_action :current_user, only: [:show]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
  user = User.new(user_params)

  if user.save
     token = encode_token({user_id: user.id})
    render json: {user: UserSerializer.new(user).serializable_hash, jwt: token}
  else
    render json: { message: 'Sorry, the user could not be saved!', errors: user.errors.full_messages }
  end
end

  # def show
  # end
  #
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
  #
  # def books_params
  #   params.requir(:user).permit(:name, :bio, :genres)
  # end
  #
  # def current_user
  #   @user = User.find(params[:id])
  # end
end
