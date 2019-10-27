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
|birth_day|date|null: false|
|profile|text|null: false|
|late_id|integer|null: false|
|point|integer|null: false|
|avatar|string|null: false|


### Association
- has_many:comments
- has_many:messages
- has_many:todos
- has_many:creditcatds
- has_many:likes
- has_many:lates
- has_many:addresses
- has_many:buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many:sale_items, -> { where("buyer_id is NULL") }, "foreign_key:saler_id", class_name: "Item"
- has_many:sold_items, -> { where("buyer_id is not NULL") }, "foreign_key:saler_id", class_name: "Item"

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|

### Association
- belongs_to:item


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string|

### Association
- belongs_to:user

## latesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|text|text|
|late|integer|

### Association
- belongs_to:user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|item_id|integer|
|text|text|

### Association
- belongs_to:item
- belongs_to:user


## todosテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|text|text|

### Association
- belongs_to:user

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|cardinfo|

### Association
- belongs_to:user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|item_id|integer|
|like|string|

### Association
- belongs_to:item
- belongs_to:user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|messages|text|
|user_id|integer|
|item_id|integer|

### Association
- belongs_to:user
- belongs_to:item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_description|text|null: false|
|brand_id|references|foreign_key: true|
|condition|integer|null: false|
|delivery_way|integer|null: false|
|delivery_burden|integer|null: false|
|origin_of_delivery|integer|null: false|
|shipment_days|integer|null: false|
|price|integer|null: false|
|size|integer|null: false|
|saler_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association
- belongs_to:buyer, class_name: "User"
- belongs_to:seller, class_name: "User"
- belongs_to:brand

- has_many:comments
- has_many:images
- has_many:likes
- has_many:messages
- has_many:item-category      
- has_many:categories, through:　:item-category     


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|item_id|integer|

### Association
- has_many:items
- has_many:categories,through:　:brand-category
- has_many:brand-categories




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
|name|string|
|parent_id|integer|


### Association
- has_many:brand-categories
- has_many:item-categories
- has_many:items, through: :item-category
- has_many:brands, through: :brand-category















