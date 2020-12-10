FactoryBot.define do
  factory :comment, class: 'Comment' do
    body {Faker::Lorem.paragraph}
  end
end
