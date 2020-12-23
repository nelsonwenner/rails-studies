FactoryBot.define do
  factory :invitation, class: 'Invitation' do
    requester_id { 0 }
    guest_id { 0 }
  end
end
