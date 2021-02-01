# DB 設計

## users table

| Column              | Type                | Options                  |
|---------------------|---------------------|--------------------------|
| nickname            | string              | null: false              |
| email               | string              | null: false,unique: true |
| encrypted_password  | string              | null: false              |
| last_name           | string              | null: false              |
| first_name          | string              | null: false              |
| katakana_last_name  | string              | null: false              |
| katakana_first_name | string              | null: false              |
| date                | date                | null: false              |

### Association

* has_many :items
* has_many :purchases


## items table

| Column              | Type                | Options                |
|---------------------|---------------------|------------------------|
| product_name        | string              | null: false            |
| product_details     | text                | null: false            |
| category_id         | integer             | null: false            |
| product_status_id   | integer             | null: false            |
| shipping_charges_id | integer             | null: false            |
| prefecture_id       | integer             | null: false            |
| days_to_ship_id     | integer             | null: false            |
| selling_price       | integer             | null: false            |
| user                | references          | foreign_key: true      |


### Association

- belongs_to :user
- belongs_to :purchase

## purchase table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item              | references          | foreign_key: true       |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefecture_id       | integer             | null: false            |
| municipality       | string              | null: false             |
| address            | string              | null: false             |
| building name      | string              |                         |
| phone number       | string              | null: false             |
| purchase           | references          | foreign_key: true       |

### Association

- belongs_to :purchase
