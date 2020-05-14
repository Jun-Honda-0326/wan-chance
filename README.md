# About this App

- このサービスはワンチャン好きのための交流サイトです。自分のワンチャンの可愛い写真を掲載したり、気になる飼い主さんにはダイレクトメッセージを送ったりして交流を深めてオフラインでワンチャンを通じて繋がりましょう！！


# DB設計
(https://user-images.githubusercontent.com/60055417/81885019-634fc900-95d4-11ea-9562-38b9ddd5033b.png)

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
- has_many :entries
- has_many :rooms, through: :entries

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|text|text||
|user_id|integer|null:false|
### Association
- belongs_to :user
- has_many :comments

## post_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|
|tag|references||
- belongs_to :post
- belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
- has_many :post_tags
- has_many :posts, through: :post_tags

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer||
|post_id|integer||
### Association
- belongs_to :post
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text||
|user|references||
|room|references||
### Association
- belongs_to :user
- belongs_to :room

## roomsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
### Association
- has_many :massages
- has_many :entriess
- has_many :users, through: :entries

## entriesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references||
|room|references||
### Association
- belongs_to :user
- belongs_to :room




