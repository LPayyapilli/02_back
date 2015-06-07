class PictureSerializer < ActiveModel::Serializer
  attributes :name, :url

  def url
    "<img class='picture' data-id='#{object.id}' src ='https://s3-us-west-2.amazonaws.com/imagebucketeer/large/#{object.id}/#{object.image_file_name}'/>"
  end
end
