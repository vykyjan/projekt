namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Honza",
                 surname: "Vykydal",
                 email: "vykyjan@seznam.org",
                 password: "jezevec",
                 password_confirmation: "jezevec",
                 person: "2",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   surname: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   person: 2,
                   admin: true,)
    end
  end
end