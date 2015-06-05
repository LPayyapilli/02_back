User.destroy_all
user_one = User.create!(username:'luke', email:'luke@luke.com', password:'luke', first_name: 'luke', last_name: 'luke')
file = Rack::Test::UploadedFile.new(Rails.root + 'image.png', 'image/png')
picture_one = user_one.pictures.create!(name: 'I am user one!', image: file)
