## users テーブル

| Column            | Type   | Options     |
| ----------------  | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |


### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column           | Type      | Options                      |
| ---------------- | --------- | ---------------------------- |
| product          | string    | null: false                  |
| explanation      | text      | null: false                  |
| category_id      | integer   | null: false                  |
| condition_id     | integer   | null: false                  |
| delivery_fee_id  | integer   | null: false                  |
| delivery_area_id | integer   | null: false                  |
| delivery_days_id | integer   | null: false                  |
| price            | integer   | null: false                  |
| user             | references|null: false, foreign_key: true|

### Association

- has_one :buyer
- belongs_to :user

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| buyer           | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer

## buyers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :items
- has_one :addresses
- belongs_to :user