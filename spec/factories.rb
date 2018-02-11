FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "Name #{n}"}
    sequence(:email) {|n| "Email#{n}@gmail.com"}
    sequence(:password) {|n| "Password#{n}"}
  end

  factory :category do
    sequence(:name) {|n| "Name #{n}"}
  end

  factory :idea do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:description) {|n| "Description #{n}" }
    user
    category
  end

end
