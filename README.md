# アプリケーション名
MEMORY ~あなたの想いをここに~

# アプリケーション概要
日常の出来事をシェアして、交流関係を広げることができ、同じ趣味の人を見つけることができる。

# URL
http://13.230.14.27/

# テスト用アカウント
・ Basic認証ID : admin
・ Basic認証パスワード : 2222
・ メールアドレス1 : aaa@aaa
・ パスワード1 : aaaaaa
・ メールアドレス2 : bbb@bbb
・ パスワード2 : bbbbbb

# 利用方法

## 日常の投稿
1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う
2. 新規投稿ボタンから、タイトル・本文・画像を入力し、投稿を行う。
3. 投稿の日時が新しいものが順に表示されている。

## 他者との共有
1. 気になった投稿にはいいね・コメントをすることができる。
2. ユーザーの詳細ページからユーザーをフォローすることができる。
3. マイページへ飛ぶと自分の投稿・フォロー・フォロワーを確認することができる。
4. マイページを編集することもでき、プロフィール画像もつけることができる。
5. ヘッダーのタグから、投稿を検索することができる。

# アプリケーションを作成した背景
テックキャンプで受講中、メモアプリや手書きで書いた際、調べるのに時間がかかってしまっていた。自分のアカウントにまとめて記入し、調べることができれば探している時間を学習に使うことができると考えた。また、他者と共有することができるので、自分では知り得なかった情報を知ることができ、エンジニアとの成長スピードも早くなると考え、SNSアプリケーションを開発した。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1kzvp3Qj8q-ArmiXsKD6yEQgHUxLIwfxUR86TfeajcLg/edit#gid=982722306

# 実装した機能についての画像
・新規登録
https://gyazo.com/649e6ad4cda8e2d8e8c3288f9f32639a
・ログイン
https://gyazo.com/946c28c132cf5c72a5272d3a709992ea
・新規投稿
https://gyazo.com/83d533ac78869e11338ea6f62279979e
・投稿詳細ページ
https://gyazo.com/09c480f20686a77694afb5fffdac5299
・投稿編集
https://gyazo.com/59844c7d433ad37ea854b59de81e477e
・投稿削除
https://gyazo.com/59b2f31b9b91234a374c768a94132771
・いいね機能
https://gyazo.com/b3ded7d53aa2fd4f0babd577eca9a86a
・コメント機能
https://gyazo.com/7d6f0b24fa5880c6b07e9266188a9cf5
・投稿詳細ページからユーザー詳細ページへの遷移
https://gyazo.com/e8b0752c08174023100750dec4abfc0b
・フォロー機能
https://gyazo.com/1be6d56530f6ed4c7559e6c7d5511ad7
・マイページ編集
https://gyazo.com/b835bb327d85a4ef0f97c21582cd6001
・投稿検索
https://gyazo.com/c2359cda1e2e1a07a3c14af2b65d50a9

# 実装予定の機能
・ハッシュタグ検索機能
・いいね、コメント、フォローの通知機能
・いいね機能の非同期機能
・投稿の下書き機能
・複数画像投稿機能
・レイアウトをより良くする

# 開発環境
・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行。
% git clone https://github.com/naoki0811/record
% cd projects
% cd record
% bundle install
% yarn install
% rails s

# 工夫したポイント
ヘッダーのロゴを工夫しました。サイトで一からロゴを作りました。アプリ名のmemoryとは、学んだことや日常の出来事を記録してほしいという意味でつけました。サブタイトルの「~あなたの想いをここに~」とはいうのは、今自分がどのレベルなのかこれから何をしていきたいのかを投稿してほしいという意味でつけました。レイアウトも落ち着いた雰囲気にして、使っていただきやすいアプリケーションを作成しました。

# テーブル設計

## users(ユーザー情報） テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |


### Association

-has_many :tweets, dependent: :destroy
-has_many :favorites, dependent: :destroy
-has_many :comments, dependent: :destroy
-attachment :profile_image
-has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
-has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
-has_many :following_user, through: :follower, source: :followed
-has_many :follower_user, through: :followed, source: :follower


## tweets(投稿情報） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
-belongs_to :user
-has_many :comments, dependent: :destroy
-has_many :favorites, dependent: :destroy
-has_one_attached :image


## favorites(いいね機能) テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :tweet


## comments(コメント） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :tweet


## relationships(フォロー機能) テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| follower           | references | null: false, foreign_key: true |
| followed           | references | null: false, foreign_key: true |


### Association

-belongs_to :follower, class_name: 'User'
-belongs_to :followed, class_name: "User"
