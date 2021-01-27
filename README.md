# DB 設計

## users table

| Column              | Type                | Options                 |
|---------------------|---------------------|-------------------------|
| nickname            | string              | null: false             |
| email               | string              | null: false             |
| encrypted_password  | string              | null: false             |
| last_name           | string              | null: false             |
| first_name          | string              | null: false             |
| katakana_last_name  | string              | null: false             |
| katakana_first_name | string              | null: false             |
| date                | string              | null: false             |

### Association

* has_many :exhibition
* has_many :comments
* has_many :Purchase


## exhibition table

| Column              | Type                | Options                |
|---------------------|---------------------|------------------------|
| Product name        | text                | null: false            |
| Product Details     | text                | null: false            |
| Category            | string              | null: false            |
| Product status      | string              | null: false            |
| Shipping charges    | string              | null: false            |
| Shipping area       | string              | null: false            |
| Days to ship        | string              | null: false            |
| Selling price       | string              | null: false            |
| user                | references          | foreign_key: true      |

### Association

- belongs_to :user
- has_many :comments
- belongs_to :Purchase

## comments table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| text               | text                | null: false             |
| prototype          | references          | foreign_key: true       |
| user               | references          | foreign_key: true       |

### Association

- belongs_to :exhibition
- belongs_to :user


## purchase table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefectures        | string              | null: false             |
| municipality       | string              | null: false             |
| address            | string              | null: false             |
| building name      | string              | null: false             |
| phone number       | string              | null: false             |
| prototype          | references          | foreign_key: true       |
| user               | references          | foreign_key: true       |

### Association

- has_many :exhibition
- belongs_to :user

## credit_card table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| card_information   | string              | null: false             |
| expiration_date    | string              | null: false             |
| security_code      | string              | null: false             |
| Purchase           | references          | foreign_key: true       |
| user               | references          | foreign_key: true       |

### Association

- belongs_to :user
- belongs_to :purchase