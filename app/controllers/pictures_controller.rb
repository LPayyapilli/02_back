class PicturesController < ApiController
  # before_action :set_user

  def index
    # retrieve the user for the pictures
    @pictures = current_user.pictures

    # return the JSON representation of this user's pictures
    render json: @pictures
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
    @picture = @current_user.pictures.new(picture_params)
    if @picture.save
      render json: @picture, status: :created
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/picture/:id

  def destroy
    @picture = @current_user.pictures.find(params[:id])
    @picture.destroy
    head :no_content
  end

  private

  def picture_params
    params.permit(:name, :image)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
