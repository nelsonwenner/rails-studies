FactoryBot.define do
  factory :post, class: 'Post' do
    title {Faker::Book.title}
    body {Faker::Lorem.paragraph}
  end
end
