FactoryBot.define do
  factory :item do
    product_name    { '商品名' }
    product_details { '商品の説明' }
    category_id        { 1 }
    product_status_id  { 1 }
    shipping_charge_id { 1 }
    prefecture_id      { 1 }
    days_to_ship_id    { 1 }
    selling_price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
