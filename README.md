
text1

# README
# Qiita DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|birth_year_on|date|null: false|
|birth_month_on|date|null: false|
|birth_day_on|date|null: false|
|profile|text|
|point|integer|null: false|
|avatar|string|


### Association
- has_many:comments
- has_many:messages
- has_many:todos
- has_many:creditcatds
- has_many:likes
- has_many:rates
- has_many:addresses
- has_many:buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many:sale_items, -> { where("buyer_id is NULL") }, "foreign_key:saler_id", class_name: "Item"
- has_many:sold_items, -> { where("buyer_id is not NULL") }, "foreign_key:saler_id", class_name: "Item"

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to:item


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string|

### Association
- belongs_to:user

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|text|
|rate|integer|null: false|

### Association
- belongs_to:user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to:item
- belongs_to:user


## todosテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|text|

### Association
- belongs_to:user

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|cardinfo|string|

### Association
- belongs_to:user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|like|integer|

### Association
- belongs_to:item
- belongs_to:user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to:user
- belongs_to:item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_description|text|null: false|
|brand_id|references|foreign_key, null: false|
|condition|integer|null: false|
|delivery_way|integer|null: false|
|delivery_burden|integer|null: false|
|origin_of_delivery|integer|null: false|
|shipment_days|integer|null: false|
|price|integer|null: false|
|size|integer|null: false|
|saler_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- belongs_to:buyer, class_name: "User"
- belongs_to:seller, class_name: "User"
- belongs_to:brand

- has_many:comments
- has_many:images
- has_many:likes
- has_many:messages
- has_many:items-categories      
- has_many:categories, through:　:items-categories    


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|item_id|integer|foreign_key: true, null: false|

### Association
- has_many:items
- has_many:categories,through:　:brands-categories
- has_many:brands-categories




## brand-categoryテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true, null: false|
|category_id|references|foreign_key: true, null: false|

### Association
- belongs_to:brand
- belongs_to:category


## item-categoryテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true, null: false|
|category_id|references|foreign_key: true, null: false|

### Association
- belongs_to:category
- belongs_to:item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|foreign_key: true, null: false|


### Association
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id
- has_many:brands-categories
- has_many:items-categories
- has_many:items, through: :items-categories
- has_many:brands, through: :brands-categories















