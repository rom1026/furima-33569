# DB 設計

## users table

| Column              | Type                | Options                 |
|---------------------|---------------------|-------------------------|
| nickname            | text                | null: false             |
| email               | string              | null: false             |
| password            | string              | null: false             |
| last_name           | string              | null: false             |
| first_name          | string              | null: false             |
| katakana_last_name  | string              | null: false             |
| katakana_first_name | string              | null: false             |
| birthday_year       | string              | null: false             |
| birthday_month      | string              | null: false             |
| birthday_day        | string              | null: false             |

### Association

* has_many :exhibition
* has_many :comments

