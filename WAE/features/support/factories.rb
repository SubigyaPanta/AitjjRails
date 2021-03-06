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
    email 'subigya_admin@ait.asia'
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

  factory :BlockedRole, class: Role do
    name 'blocked'
  end

  # factory :AdminUserWithRole, :parent => :AdminUser do
  #   AdminRoles {[FactoryGirl.build(:AdminRole)]}
  # end

  ########### NEW LEARNED :: TRAITS AND DYNAMIC ASSOCIATION ###########

  # These two user and role is just created so that we can use it with product
  # We replace thme with @current_user in the code anyway
  factory :user do
    sequence(:email){|e| "st#{e}@ait.asia"}
    password 'password'
    role
  end
  factory :role do
    name 'admin'
  end

  factory :category do
    name 'Dummy Cat'
  end

  factory :product_photos do
    link '6048d8ca7e07a7834423f4a5c922013e.png'
  end

  factory :product do
    # name 'First Product'
    sequence(:name){ |n| "Product No. #{n}" }
    description 'First Product'
    color 'Red'
    weight 2
    selling_price 200
    # association :user, :factory => :AdminUser
    user
    # product_photos {FactoryGirl.build :product_photos}
  end

  factory :comment do
    content 'Comment content'
    user
  end

  trait :with_comments do
    ignore do
      number_of_comments 3
    end
    after :create do |product, evaluator|
      FactoryGirl.create_list :comment, evaluator.number_of_comments, :product => product
    end
  end
  # trait :with_user do
  #   ignore do
  #     user :AdminUser
  #   end
  #
  #   after :create do |product, evaluator|
  #     FactoryGirl.create :user, evaluator.user, :product => product
  #   end
  # end

  # This will create fixed i.e 3 product_photos (however we are using only 1 in code)
  # trait :with_product_photos do
  #   after :create do |product|
  #     FactoryGirl.create_list :product_photos, 3, :product => product
  #   end
  # end
  # With this we can create variable number of photos
  # FactoryGirl.create :product, :with_product_photos, :number_of_photos => 4
  trait :with_product_photos do
    ignore do
      number_of_photos 3
    end

    after :create do |product, evaluator|
      FactoryGirl.create_list :product_photos, evaluator.number_of_photos, :product => product
    end
  end

end
