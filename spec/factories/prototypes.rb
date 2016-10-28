FactoryGirl.define do

  factory :prototype do
    title            { Faker::Name.name }
    catchcopy        { Faker::Lorem.word }
    concept          { Faker::Lorem.sentence }
    created_at       { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
    updated_at       { Faker::Time.between(1.days.ago, Time.now, :all) }
    user
    main_image

    trait :with_sub_images do
      transient do   # テーブルにないカラムに対して使う(transient: つかの間の、一瞬の)
        sub_images_count   { Faker::Number.between(1, 3) }
      end

      after(:build) do |prototype, evaluator|
        build_list(:sub_image, evaluator.sub_images_count, prototype: prototype)
      end

      after(:create) do |prototype, evaluator|
        create_list(:sub_image, evaluator.sub_images_count, prototype: prototype)
      end
    end

    trait :with_likes do
      transient do
        likes_count      { Faker::Number.between(1, 5) }
      end

      after(:create) do |prototype, evaluator|
        create_list(:like, evaluator.likes_count, prototype: prototype)
      end
    end

    trait :with_comments do
      transient do
        comments_count   { Faker::Number.between(1, 5) }
      end

      after(:create) do |prototype, evaluator|
        create_list(:comment, evaluator.comments_count, prototype: prototype)
      end
    end

    factory :invalid_prototype do
      title nil
    end
  end
end
