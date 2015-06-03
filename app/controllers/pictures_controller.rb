class PicturesController < ApiController
  # before_action is a Rails method that will invoke the method argument
  before_action :set_user

  def index
    # retrieve the user for the pictures
    @user = User.find(params[:user_id])

    # retrieve the users pictures
    @picture = @user.pictures

    # return the JSON representation of this user's pictures
    render json: @picture
  end

  # GET /users/:user_id/picture/:id

  def show
    # Find the user for this picture
    @user = User.find(params[:user_id])
    # Find a specific picture for a user
    @picture = @user.picture.find(params[:id])
    # return a JSON representation of this picture
    render json: @picture
  end

  # POST /users/:user_id/pictures

  def create
    # use strong params to make sure that users dont do a SQL injection attack
    @picture = @user.picture.build(picture_params)

    if @picture.save
      render json: @picture, status: :created
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @picture = @user.pictures.find(params[:id])
    @picture.destroy
    head :no_content
  end

  private

  def picture_params
    params.require(:picture).permit(:name)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
