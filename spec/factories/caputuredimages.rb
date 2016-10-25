include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :capturedimage do
    created_at  { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
    updated_at  { Faker::Time.between(1.days.ago, Time.now, :all) }
    picture { fixture_file_upload("spec/fixtures/img/sample.jpg", "image/jpg") }

    trait :main do
      role   0
    end

    trait :sub do
      role   1
    end

    factory :main_image, traits: [:main]
    factory :sub_image, traits: [:sub]
  end

end
