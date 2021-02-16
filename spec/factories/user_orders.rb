FactoryBot.define do
  factory :user_order do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 11 }
    municipality  { '狭山市' }
    address       { '入間川3133-1-208' }
    building_name { 'ロイヤルステージ' }
    phone_number  { '08055370571' }
    association :user_id, factory: :user
    association :item_id, factory: :item
  end
end
