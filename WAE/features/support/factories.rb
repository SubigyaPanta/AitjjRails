FactoryGirl.define do
  factory :NewGmailUser, class: User do
    email "new@gmil.com"
    password "secret123"
    password_confirmation "secret123"
  end

  factory :NewAitAsiaUser, class: User do
    email "st118492@ait.asia"
    password "secret123"
    password_confirmation "secret123"
  end

  factory :NewAitAcUser, class: User do
    email "st118492@ait.ac.th"
    password "secret123"
    password_confirmation "secret123"
  end
end
