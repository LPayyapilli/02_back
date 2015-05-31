class User < ActiveRecord::Base
  has_secure_password
  has_many :pictures
  before_create :generate_token
  has_attached_file :avatar, :styles => { :medium => '300x300>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def generate_token
    return if token.present?

    begin
      self.token = SecureRandom.uuid.gsub(/\-/,'')
    end
    while self.class.exists?(token: token)
    end
  end
end
