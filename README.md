# アプリ名: [わん-chance](http://www.wan-chance.work/)
ワンチャン好きのための写真投稿&交流サイトです。自分のワンチャンの可愛い写真を掲載したり、気になる飼い主さんにダイレクトメッセージを送ったりして交流を深めてオフラインでワンチャンを通じて繋がりましょう！！

# 制作背景
ワンチャンが好きな人は本当に好きです。私自身その一人ですが、ワンチャンの写真を眺めているだけで心が癒されます。なので、ワンチャンの写真だけが掲載されているサイトを作りたいなと思い、制作に至りました。制作途中で、素敵なワンチャンの写真の投稿をするユーザーと繋がれる機能があれば、オフラインでも仲間ができるかもしれないとの思いからコメント機能とダイレクトメッセージ機能を実装しました。
ワンチャンの写真を通じてユーザー同士がオンライン上、そしてオフラインでも繋がれる機会（chance）になって欲しいとの思いからこのアプリ名にしました。

# 使用言語等
Ruby/Ruby on Rails/Haml/SCSS/Javascripit

# インフラ環境等
- インフラ: AWS（EC２/S3/Route53)
- AppServer: Unicorn
- WebServer: Nginx
- デプロイ: Capstranoによる自動デプロイ
- DB: 本番環境 MySQL、 開発環境 PostgreSQL 

# 実装機能一覧
- ユーザー登録、ログイン、ログアウト機能(devise)
- 記事一覧/投稿・削除機能
- 画像プレビュー機能(JavaScript, CarrierWave)
- 検索機能
- タグ付け機能
- いいね機能（非同期通信）
- コメント機能
- ユーザー同士のダイレクトメッセージ機能
- ページネーション機能(kaminari)
- 管理者機能（rails_admin)
- 単体テスト（モデルバリデーションチェック）

# 使用方法
まずはログインをして、新規投稿ボタンからお気に入りのワンチャンの写真を投稿してみましょう。それから他のユーザーが投稿した写真も見てみましょう。気になる投稿があれば、詳細画面に写ってコメントをしましょう。ユーザー名をクリックすると、ユーザーのページに飛べるので、そこから気になるユーザーにダイレクトメッセージを送ってやりとりをしてみて下さい。新たな出会いがあるかもしれません。

# 使用イメージ
1. まずはログインして新規投稿してみましょう（テスト用のアカウントを用意しております）

![d3470ae048919a15d06e7a1f9d0abb5a](https://user-images.githubusercontent.com/60055417/84569005-5c2bfe80-adbe-11ea-8327-c52d1cf58d60.jpg)

2. 一覧ページでかわいいワンチャンの写真があればチェックしてコメントしてみましょう！<br>
※写真をクリックすれば、コメント画面へ遷移できます<br>
ついでにいいねもしてあげましょう！！

![21da6f207257fcc606eabb1ed32d16b5](https://user-images.githubusercontent.com/60055417/84569113-ff7d1380-adbe-11ea-861b-53857daa18ee.jpg)

３. 気になる飼い主さん（ユーザー）には直接ダイレクトメッセージを送って繋がりましょう！！<br>
※メッセージ画面への行き方: 投稿者の名前をクリック→ダイレクトメッセージを送る→メッセージ画面へ遷移

![a1449feb743974084c405cb1a77bf4b9](https://user-images.githubusercontent.com/60055417/84569403-3ce2a080-adc1-11ea-9301-55928c0b4cc3.jpg)

# 今後実装していきたい機能
- いいねした投稿一覧の作成
- コメント、いいね、メッセージの通知機能
- メッセージ、コメント送信機能の非同期通信化、自動スクロール
- タグのキーワード検索
- 管理者として新規登録ができる
- N+1問題の解消
- 統合テスト

# DB設計
![わんーchance_DB設計 - データベース ER 図](https://user-images.githubusercontent.com/60055417/84569620-0e65c500-adc3-11ea-9fda-88ee3d7d5af5.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|admin|boolean|default:false|
### Association
- has_many :post
- has_many :comments
- has_many :messages
- has_many :entries
- has_many :rooms, through: :entries 
## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|-----|
|image|string|-----|
|user_id|integer|-----|
### Association
- belongs_to :user
- has_many :comments
- has_many :post_tags, dependent: :delete_all
- has_many :tags, through: :post_tags
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|-----|
|user_id|integer|-----|
|post_id|integer|-----|
### Association
- belongs_to :post
- belongs_to :user
## post_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|bigint|add_index, foreign_key:true|
|tag_id|bigint|add_index, foreign_key:true|
### Association
- belongs_to :post
- belongs_to :tag
## entoriesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|binint|add_index, foreign_key:true|
|room_id|bigint|add_index, foreigh_key:true|
### Association
- belongs_to :user
- belongs_to :room
## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|-----|
|user_id|bigint|-----|
|room_id|bigint|-----|
### Association
- belongs_to :user
- belongs_to :room
## roomsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|-----|
### Association
- has_many :messages
- has_many :entries
- has_many :users, through: :entories
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|bigint|add_index :true|
|user_id|bigint|add_index :true|
### Association
- belongs_to :post
- belongs_to :user
