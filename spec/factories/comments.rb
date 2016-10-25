FactoryGirl.define do
  factory :comment do
    user
    prototype
    content { Faker::Lorem.sentence }
  end
end
