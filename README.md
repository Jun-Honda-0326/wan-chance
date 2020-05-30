# わん-chance
このサイトはワンチャン好きのための写真投稿&交流サイトです。自分のワンチャンの可愛い写真を掲載したり、気になる飼い主さんにダイレクトメッセージを送ったりして交流を深めてオフラインでワンチャンを通じて繋がりましょう！！

# 制作背景
ワンチャンが好きな人は本当に好きです。私自身その一人ですが、ワンチャンの写真を眺めているだけで心が癒されます。ワンチャンの写真だけが掲載されているサイトを作りたいなと思い、制作に至りました。制作途中で、素敵なワンチャンの写真の投稿をするユーザーと繋がれる機能があれば、オフラインでも仲間ができるかもしれないとの思いからコメント機能とダイレクトメッセージ機能を実装しました。
わん-chanceはワンチャンの写真を通じてがユーザー同士が繋がれる機会（chance）になって欲しいとの思いからこのアプリ名にしました。

# 本番環境
- URL:http://www.wan-chance.work/
- インフラ：AWS（EC２）
- DB:MySQL
- DNS：Route53
 
# このアプリの使用方法
まずはログインをして、新規投稿ボタンからお気に入りのワンチャンの写真を投稿してみましょう。それから他のユーザーが投稿した写真も見てみましょう。気になる投稿があれば、詳細画面に写ってコメントをしましょう。ユーザー名をクリックすると、ユーザーのページに飛べるので、そこから気になるユーザーにダイレクトメッセージを送ってやりとりをしてみて下さい。新たな出会いがあるかもしれません。


# DB設計
![わんーchance_DB設計 - データベース ER 図](https://user-images.githubusercontent.com/60055417/82001792-f6e9ce00-9696-11ea-8d05-8262e6a51d24.png)

# 実装機能
- ユーザー登録、ログイン、ログアウト機能
- 新規投稿、投稿削除機能
- タグ付け機能
- コメント機能
- ユーザー同士のダイレクトメッセージ
- ページネーション機能
- 管理者機能（rails_adminにより実装

# 課題や今後実装したい機能
- 現状では検索機能が投稿メッセージにしか読み込まれていないので、タグのキーワード検索もできるようにする。
- 管理者としてログインすることは可能であるが、管理者として新規登録ができるようにする。
- 投稿画像のプレビュー機能（JavaScriptで実装）
