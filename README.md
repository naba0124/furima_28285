# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| --------                  | ------ | ----------- |
| nickname                  | integer | null: false |
| email                     | string | null: false |
| password                  | string | null: false |
| passwoed_confirmation     | string | null: false |
| user_id                   | intger | null: false |
| bithday                   | date | null: false |
| firstname                 | integer | null: false |
| lastname                | integer | null: false |
| firstname_kana            | integer | null: false |
| lastname_kana                   | integer | null: false |

### Association

- has_many :comments
- has_many :items
- has_one :sales

## comments テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user_id   | integer | null: false |
| comments | text | null:false |

### Association

- belongs_to :users
- belongs_to :items

## items テーブル

| Column | Type       | Options                    |
| ------ | ---------- | -------------------------- |
| name   | integer | null: false |
| image   | text | null: false |
| categoly                  | integer | null: false |
| price                     | integer | null: false |
| user_id                 | integer | null: false |
| text                    | text | null: false |
| stetus                  | intger | null: false |
| addres_origin                  | integer | null: false |
| burden                     | integer | null: false |
| delivery_time                 | integer | null: false |

### Association

- has_many :comments
- belongs_to :users
- has_one :sale


## sales テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card_number | string | null: false                    |
| expirnation_date    | date | null: false |
| security_code    | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| post_number | integer     | null: false       |
| city    | integer | null: false|
| city_2    | string | null: false |
| city_number         | string | null: false |
| build_name                     | string | null: false |
| tel                  | string | null: false |

### belongs_to :sales

