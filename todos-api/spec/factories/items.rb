FactoryBot.define do
  factory :item do
    name { Faker::StartWars.character }
    done false
    todo_id nil
  end
end