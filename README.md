# テーブル設計

## users テーブル

| Column                   | Type    | Options     |
| ------------------------ | ------  | ----------- |
| email                    | string  | null: false |
| encrypted_password       | string  | null: false |
| nickname                 | string  | null: false |
| first_name               | string  | null: false |
| second_name              | string  | null: false |
| first_name_kana          | string  | null: false |
| second_name_kana         | string  | null: false |
| birthday                 | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buys


## items テーブル

| Column        |    Type    |  Options                        |
| ------------- | ---------- | ------------------------------- |
|  text         |    text    | null: false                     |
| user_id       | integer    | null: false,  foreign_key: true |
| price         | integer    | null: false                     |
|  name         |  string    | null: false                     |
| category_id   | integer    | null: false                     |
| status_id     | integer    | null: false                     |
| shipping_id   | integer    | null: false                     |
| prefecture_id | integer    | null: false                     |
|  day_id       | integer    | null: false                     |

### Association

- belongs_to :user
- has_many :comments
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
- has_one :address

# addressesテーブル

| Column        |    Type    |  Options                       |
| ------------- | ---------- | ------------------------------ |
| postal_code   |  string    | null: false                    |
|    city       |  string    | null: false                    |
| house_number  |  string    | null: false                    |
| building_name |  string    |                                |
| phone_number  |   string   | null: false                    |
| prefecture_id | integer    | null: false                    |
| buy_id        | integer    | null: false, foreign_key: true |

### Association


- belongs_to :buy
