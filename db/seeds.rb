
user_one = User.create(username:'user_one', email:'chad@chad.com', password:'chaddychad', first_name: 'user', last_name: 'name')
file = Rack::Test::UploadedFile.new(Rails.root + 'image.png', 'image/png')
picture_one = user_one.pictures.create!(name: 'I am user one!', image: @file)
