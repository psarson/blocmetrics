FactoryGirl.define do
  factory :user do
    id { Faker::Name.name }
    sequence(:email) { Faker::Internet.free_email('Mancy') }
    password { Faker::Internet.password(10, 20) }
  end
end
