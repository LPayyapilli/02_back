class UsersController < ApiController
  # before_filter :authorize
  # skip_before_filter  :verify_authenticity_token

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
end
