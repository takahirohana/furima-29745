<!-- # README -->
<!-- 
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->


# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| real_name    | string | null: false |
| name_reading | string | null: false |
| birthday     | string | null: false |



### Association

- has_many :items
- has_one :purchase
- has_one :shipping_address

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| product_name | string  | null: false |
| category     | string  | null: false |
| price        | integer | null: false |
| seller       | string  | null: false |
| image        | string  | null: false |
| text         | string  | null: false |
| user_id      | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase
- has_one :shipping_address

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item

## shipping_address テーブル
| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| tell          | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| building_name | string     |                                |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item