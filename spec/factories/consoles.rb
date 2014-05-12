# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :console do
    sequence(:name) { |n| "Console #{n}" }
  end
end
