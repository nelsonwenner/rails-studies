FactoryBot.define do
  factory :profile, class: 'Profile' do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    address_attributes { {
      street: Faker::Address.street_address, 
      suite: Faker::Address.building_number,
      city: Faker::Address.city,
      zipcode: Faker::Address.zip_code
    } }
  end
end
