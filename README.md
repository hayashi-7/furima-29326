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

| Column        |    Type    |  Options                        |
| ------------- | ---------- | ------------------------------- |
|  image        |    text    | null: false                     |
|  text         |    text    | null: false                     |
| user_id       | integer    | null: false,  foreign_key: true |
| price         | integer    | null: false                     |
|  name         |    text    | null: false                     |
| category_id   | integer    | null: false                     |
| status        | integer    | null: false                     |
| shipping      | integer    | null: false                     |
| prefecture_id | integer    | null: false                     |
|  day          | integer    | null: false                     |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :category
- has_one :buy



## comments テーブル

| Column   |  Type      | Options                        |
| -------  | ---------- | ------------------------------ |
|   text   |    text    |                                |
|  user_id | integer    | null: false, foreign_key: true |
|  item_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

# buysテーブル

| Column     |    Type    |  Options                          |
| ---------- | ---------- | --------------------------------- |
|  item_id   |  integer   | null: false,  foreign_key: true   |
|  user_id   |  integer   | null: false,  foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_many :addresses

# addressesテーブル

| Column        |    Type    |  Options                       |
| ------------- | ---------- | ------------------------------ |
| postal_code   |  string    | null: false                    |
|    city       |  string    | null: false                    |
| house_number  | integer    | null: false                    |
| building_name |  string    |                                |
| phone_number  |   string   | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to :buy
