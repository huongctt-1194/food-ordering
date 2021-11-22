FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.phone_number}
    password {"12312312"}
  end
end
