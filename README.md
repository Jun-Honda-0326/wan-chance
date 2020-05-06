# About this App

- このサービスはワンチャン好きのための交流サイトです。自分のワンチャンの可愛い写真を掲載したり、気になる飼い主さんにはダイレクトメッセージを送ったりして交流を深めてオフラインでワンチャンを通じて繋がりましょう！！

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null:false|
|password|string|null: false|
|name|string|null:false|
### Association
- has_many :posts
- has_many :comments
- has_many :messages

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|text|text||
|user_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user_id|integer|null:false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|user_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :user



