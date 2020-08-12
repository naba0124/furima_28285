# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| --------                  | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false |
| password                  | string | null: false |
| passwoed_confirmation     | string | null: false |
| bithday                   | date | null: false |
| firstname                 | string | null: false |
| lastname                | string | null: false |
| firstname_kana            | string | null: false |
| lastname_kana                   | string | null: false |

### Association

- has_many :comments
- has_many :items
- has_one :transaction

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
| name   | integer    |   null: false              |
| image  | text       | null: false                |
| categoly| integer   | null: false                |
| price  | integer    | null: false                |
| user_id| integer | null: false, foreign_key: true |
| text   | text        | null: false               |
| stetus | intger      | null: false               |
| addres_origin| integer | null: false             |
| burden | integer     | null: false               |
| delivery_time| integer | null: false             |

### Association

- has_many :comments
- belongs_to :users
- has_one :transaction



### Association

- belongs_to :users
- belongs_to :items

## address テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| post_number | string | null: false|
| prefectures| integer | null: false|
| city    | string     | null: false |
| address | string     | null: false |
| build_name| string   |             |
| tel     | string     | null: false |
| user_id | integer    | foreign_key: true|

### belongs_to :sales

## transaction テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer    |  null:false                    |
| item_id | integer    |  null:false                    |


### Association

- belongs_to :sales
- has_one :address