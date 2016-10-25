FactoryGirl.define do

  factory :user do
    name                    { Faker::Internet.user_name }
    email                   { Faker::Internet.free_email }
    password                "00000000"
    password_confirmation   "00000000"
    member                  "Expert-3rd"
    profile                 "Hi, I'm a member of Expert 3rd course, TECH::CAMP."
    works                   "I'm a freelance engineer."
    created_at              { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
    updated_at              { Faker::Time.between(1.days.ago, Time.now, :all) }
    avatar                  "sample.jpg"
  end

end
