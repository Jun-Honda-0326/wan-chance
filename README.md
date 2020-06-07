# わん-chance
このサイトはワンチャン好きのための写真投稿&交流サイトです。自分のワンチャンの可愛い写真を掲載したり、気になる飼い主さんにダイレクトメッセージを送ったりして交流を深めてオフラインでワンチャンを通じて繋がりましょう！！


# 制作背景
ワンチャンが好きな人は本当に好きです。私自身その一人ですが、ワンチャンの写真を眺めているだけで心が癒されます。なので、ワンチャンの写真だけが掲載されているサイトを作りたいなと思い、制作に至りました。制作途中で、素敵なワンチャンの写真の投稿をするユーザーと繋がれる機能があれば、オフラインでも仲間ができるかもしれないとの思いからコメント機能とダイレクトメッセージ機能を実装しました。
ワンチャンの写真を通じてユーザー同士がオンライン上、そしてオフラインでも繋がれる機会（chance）になって欲しいとの思いからこのアプリ名にしました。

# このアプリの使用方法
まずはログインをして、新規投稿ボタンからお気に入りのワンチャンの写真を投稿してみましょう。それから他のユーザーが投稿した写真も見てみましょう。気になる投稿があれば、詳細画面に写ってコメントをしましょう。ユーザー名をクリックすると、ユーザーのページに飛べるので、そこから気になるユーザーにダイレクトメッセージを送ってやりとりをしてみて下さい。新たな出会いがあるかもしれません。

# インフラ環境等
- URL: http://www.wan-chance.work/
- インフラ: AWS（EC２)
- 画像投稿先: AWS S3
- AppServer: Unicorn、 WebServer: Nginx
- デプロイ: Capstranoによる自動デプロイ
- DB: 本番環境 MySQL、 開発環境 PostgreSQL 
- DNS： Route53

# 実装機能
- ユーザー登録、ログイン、ログアウト機能
- 新規投稿、投稿削除機能
- 画像プレビュー機能
- 検索機能
- タグ付け機能
- コメント機能
- ユーザー同士のダイレクトメッセージ機能
- ページネーション機能
- 管理者機能（rails_admin)により実装
- 単体テスト（モデルバリデーションチェック）

# DB設計
![わんーchance_DB設計 - データベース ER 図](https://user-images.githubusercontent.com/60055417/82001792-f6e9ce00-9696-11ea-8d05-8262e6a51d24.png)

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

# 実装で苦労した点など

# 課題や今後実装したい機能
- 現状では検索機能が投稿メッセージにしか読み込まれていないので、タグのキーワード検索もできるようにする。
- 管理者としてログインすることは可能であるが、管理者として新規登録ができるようにする。
- N+1問題の解消
- 統合テストの実装
