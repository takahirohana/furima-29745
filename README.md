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

| Column          | Type   | Options     |
| -------------- -| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |



### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| category        | integer    | null: false                    |
| price           | integer    | null: false                    |
| seller          | string     | null: false                    |
| text            | text       | null: false                    |
| product_status  | integer    | null: false                    |
| delivery_fee    | integer    | null: false                    |
| shipment_source | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル
| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| tell          | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| building_name | string     |                                |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase