FactoryGirl.define do
  factory :user do |f|
    f.email 'me@email.com'
    f.password 'password'

    trait :admin do
      role 'admin'
    end
  end
end
