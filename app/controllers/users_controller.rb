class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    unless @user.save
      return render json: @user.errors, status: :unprocessable_entity
    end

    render :show, status: :ok
  end

  # PATCH/PUT /users/1
  def update
    unless @user.update(user_params) 
      return render json: @user.errors, status: :unprocessable_entity
    end

    render :show, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
