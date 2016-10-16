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

  factory :AdminRole, class: Role do
    name 'admin'
  end

  factory :AdminUser, class: User do #|user|
    email 'subigya@ait.asia'
    password 'secret123'
    password_confirmation 'secret123'

    role {FactoryGirl.create(:AdminRole)}
  end

  factory :RegisteredRole, class: Role do
    name 'registered'
  end

  factory :RegisteredUser, class: User do
    email '123@ait.asia'
    password 'secret123'
    password_confirmation 'secret123'

    role {FactoryGirl.create(:RegisteredRole)}

  end

  # factory :AdminUserWithRole, :parent => :AdminUser do
  #   AdminRoles {[FactoryGirl.build(:AdminRole)]}
  # end
end
