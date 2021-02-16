class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :product_name
    validates :product_details
    validates :selling_price

    validates :category_id
    validates :product_status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    with_options numericality: { with: /\A[0-9]+\z/, message: '半角数字のみ入力可能です' } do
      validates :selling_price, inclusion: { in: 300..9_999_999 }
    end
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :product_status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
