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
| user_id       | integer    | null: false                     |
| price         | integer    | null: false                     |
| item_name     |    text    | null: false                     |
| category_id   | integer    | null: false                     |
| status        | string     | null: false                     |
| shipping      |    text    | null: false                     |
| prefecture_id | integer    | null: false                     |
|  day          | string     | null: false                     |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :category



## comments テーブル

| Column   |  Type      | Options                        |
| -------  | ---------- | ------------------------------ |
|   text   |    text    |                                |
|  user_id | integer    | null: false                    |
|  item_id | integer    | null: false                    |

### Association

- belongs_to :item
- belongs_to :user

# buysテーブル

| Column     |    Type    |  Options                          |
| ---------- | ---------- | --------------------------------- |
|  item_id   |  integer   | null: false                       |
|  user_id   |  integer   | null: false                       |

### Association

- belongs_to :user

# addressesテーブル

| Column        |    Type    |  Options                       |
| ------------- | ---------- | ------------------------------ |
| postal_code   |  string    | null: false                    |
|    city       |  string    | null: false                    |
| house_number  | integer    | null: false                    |
| building_name |  string    |                                |
| phone_number  |   string   | null: false                    |
| user_id       | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
