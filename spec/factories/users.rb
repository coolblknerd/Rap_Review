FactoryGirl.define do
  factory :user do
    email 'me@email.com'
    password 'password'

    trait :admin do
      role 'admin'
    end

    trait :member do
      email 'test_member@email.com'
      role 'member'
    end

  end
end
