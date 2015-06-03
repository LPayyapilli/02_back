class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
              :styles => { :large => "510x510#", :medium => "250x250#" },
              :processors => [:thumbnail],
              storage: :s3,
              path: "/:style/:id/:filename",
              s3_credentials: {
                bucket: ENV['bucket'],
                :aws_access_key => ENV['aws_access_key'],
                :aws_secret_key => ENV['aws_secret_key']}
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
