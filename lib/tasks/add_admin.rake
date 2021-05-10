desc "Task to add admin user"

task :add_admin_user => :environment do
  admin_user = User.new(first_name: "Admin",
               last_name: "Admin",
               email: "admin@yopmail.com",
               password: "1234567890",
               user_type: 1)
  admin_user.save

end