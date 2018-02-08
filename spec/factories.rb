FactoryGirl.define do
  factory :user do
    name     "Artur Bunko"
    email    "artur.bunko@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
