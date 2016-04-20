FactoryGirl.define do
  factory :event do
      name { Faker::App.name }
      registered_application
  end
end
