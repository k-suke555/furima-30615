# README

# テーブル設計

## usersテーブル

| column               | Type    | Options     |
|--------------------- |-------- |------------ |
| name                 | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| last_name_kanji      | string  | null: false |
| first_name_kanji     | string  | null: false |
| last_name_kana       | string  | null: false |
| first_name_kana      | string  | null: false |
| year_of_birth        | string  | null: false |
| month_of_birth       | string  | null: false |
| day_of_birth         | string  | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | string     | null: false                    |
| burden           | string     | null: false                    |
| area             | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchases
- has_many :comments

## purchases テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| address       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                     |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

