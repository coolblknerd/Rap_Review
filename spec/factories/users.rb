FactoryGirl.define do
  factory :user do
    email 'me@email.com'
    password 'password'
    id 1

    trait :admin do
      role 'admin'
      id 1
    end

    trait :member do
      email 'test_member@email.com'
      role 'member'
    end

  end
end
