FactoryBot.define do
  factory :profile do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    address {
      street {Faker::Address.street_name}
      suite {Faker::Address.building_number}
      city {Faker::Address.city}
      zipcode {Faker::Address.zip_code} 
    }
  end

end
