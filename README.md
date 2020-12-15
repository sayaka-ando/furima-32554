
## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | string | null: false |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| product       | string    | null: false |
| explanation   | text      | null: false |
| category      | string    | null: false |
| condition     | string    | null: false |
| delivery-fee  | string    | null: false |
| delivery_area | string    | null: false |
| delivery_days | string    | null: false |
| price         | string    | null: false |
| user          | references|             |

### Association

- has_one :buyer
- belongs_to :user

## buyers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
