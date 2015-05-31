class UsersController < ApplicationController
  # skip_before_filter  :verify_authenticity_token
  def login
    @user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: @user
    else
      head :unauthorized
    end
  end

  def create
    @user = User.new(user_params)
  end
  # GET /users
  def index
    # all the users
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    # find one User by id
    @user = User.find(params[:id])
    render json: @user
  end

  private

  # PATCH /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end

  def user_params
    params.require(:username, :email, :password, :first_name, :last_name, :token).permit(:avatar)
  end
end

# # POST /movies
# def create
#   @user = User.new(movie_params)
#   if @movie.save
#     render json: @movie, status: :created, location: movies_url
#   else
#     render json: @movie.errors, status: :unprocessable_entity
#    end
# end
# def user_params
  # params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
 # end
