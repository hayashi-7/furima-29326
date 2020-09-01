# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :address
- has_one :buy


## items テーブル

| Column  |    Type    |  Options                        |
| ------  | ---------- | ------------------------------- |
|  image  |    text    | null: false                     |
|  text   |    text    | null: false                     |
| user_id | references | null: false , foreign_key: true |
| price   | integer    | null: false                     |
### Association

- belongs_to :user
- has_many :comments



## comments テーブル

| Column   |  Type      | Options                        |
| -------  | ---------- | ------------------------------ |
|   text   |    text    |                                |
|  user_id | references | null: false, foreign_key: true |
|  item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

# buysテーブル

| Column  |    Type    |  Options                          |
| ------  | ---------- | --------------------------------- |
|  price  |  integer   | null: false                       |
|  user   | references | null: false, foreign_key: true    |

### Association

- belongs_to :user

# addressesテーブル

| Column       |    Type    |  Options                       |
| -------------| ---------- | ------------------------------ |
| postal_code  |  string    | null: false                    |
| prefecture   |  string    | null: false                    |
|    city      |  string    | null: false                    |
| house_number | integer    | null: false                    |
|building_name |  string    |                                |
| phone_number | integer    | null: false                    |
| user         | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
