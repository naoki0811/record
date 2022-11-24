# アプリケーション名
MEMORY 〜あなたの想いをここに〜

# アプリケーション概要
日常の学びや出来事を気楽にシェアすることで、情報の管理ができ、かつ同じ想いを持った人々とつながることができる。

# URL
http://13.230.14.27/

# テスト用アカウント
・ Basic認証ID : admin<br>
・ Basic認証パスワード : 2222<br>
・ メールアドレス1 : aaa@aaa<br>
・ パスワード1 : aaaaaa<br>
・ メールアドレス2 : bbb@bbb<br>
・ パスワード2 : bbbbbb<br>

# 利用方法

## 日常の投稿
1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う.
2. 新規投稿ボタンから、タイトル・本文・画像を入力し、投稿を行う。
3. 投稿の日時が新しいものが順に表示されている。

## 他者との共有
1. 気になった投稿にはいいね・コメントをすることができる。
2. ユーザーの詳細ページからユーザーをフォローすることができる。
3. マイページへ飛ぶと自分の投稿・フォロー・フォロワーを確認することができる。
4. マイページを編集することもでき、プロフィール画像もつけることができる。
5. ヘッダーのタグから、投稿を検索することができる。

# アプリケーションを作成した背景
テックキャンプを受講中、気づいたことや学びを、メモアプリに残したり、手書きのメモで記載していたが、情報がバラバラで、後から見返したい時に欲しい情報にすぐにたどり着けないことが課題だと感じた。
そこで、自分のアカウントにまとめて情報を記入して管理をすることで、欲しい情報にたどり着くために使っていた時間を学習に使うことができると考えた。
また、情報を他者と共有することで、自分では知り得なかった情報を知ることができ、エンジニアとしての成長スピードも早くなると考え、SNSアプリケーションを開発した。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1kzvp3Qj8q-ArmiXsKD6yEQgHUxLIwfxUR86TfeajcLg/edit#gid=982722306

# 実装した機能についての画像
・新規登録<br>
https://gyazo.com/649e6ad4cda8e2d8e8c3288f9f32639a<br>
・ログイン<br>
https://gyazo.com/946c28c132cf5c72a5272d3a709992ea<br>
・新規投稿<br>
https://gyazo.com/83d533ac78869e11338ea6f62279979e<br>
・投稿詳細ページ<br>
https://gyazo.com/09c480f20686a77694afb5fffdac5299<br>
・投稿編集<br>
https://gyazo.com/59844c7d433ad37ea854b59de81e477e<br>
・投稿削除<br>
https://gyazo.com/59b2f31b9b91234a374c768a94132771<br>
・いいね機能<br>
https://gyazo.com/b3ded7d53aa2fd4f0babd577eca9a86a<br>
・コメント機能<br>
https://gyazo.com/7d6f0b24fa5880c6b07e9266188a9cf5<br>
・投稿詳細ページからユーザー詳細ページへの遷移<br>
https://gyazo.com/e8b0752c08174023100750dec4abfc0b<br>
・フォロー機能<br>
https://gyazo.com/1be6d56530f6ed4c7559e6c7d5511ad7<br>
・マイページ編集<br>
https://gyazo.com/b835bb327d85a4ef0f97c21582cd6001<br>
・投稿検索<br>
https://gyazo.com/c2359cda1e2e1a07a3c14af2b65d50a9<br>

# 実装予定の機能
・ハッシュタグ検索機能<br>
・いいね、コメント、フォローの通知機能<br>
・いいね機能の非同期機能<br>
・投稿の下書き機能<br>
・複数画像投稿機能<br>
・レイアウトをより良くする<br>

# ER図
[![Image from Gyazo](https://i.gyazo.com/e4d4294d76385c89ad7022bf9837ff8b.png)](https://gyazo.com/e4d4294d76385c89ad7022bf9837ff8b)

# 開発環境
・フロントエンド<br>
・バックエンド<br>
・インフラ<br>
・テスト<br>
・テキストエディタ<br>
・タスク管理<br>

# ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone https://github.com/naoki0811/record<br>
% cd projects<br>
% cd record<br>
% bundle install<br>
% yarn install<br>
% rails s<br>

# 工夫したポイント
・ヘッダーのロゴ<br>
サイトで一からロゴを作りました。どんなジャンルでも合うというコンセプトで作成いたしました。

・アプリ名（memory）<br>
学んだことや日常の出来事等、なんでも記録してほしい、という気持ちから名付けました。
サブタイトルの「〜あなたの想いをここに〜」は、日常の出来事はもちろん、今自分がどのレベルなのかこれから何をしていきたいのかを投稿してほしいという意味でつけました。

・レイアウト<br>
全体的に落ち着いた雰囲気にし、気楽に投稿していただけるような雰囲気作りをいたしました。


# テーブル設計

## users(ユーザー情報） テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |


### Association

-has_many :tweets, dependent: :destroy<br>
-has_many :favorites, dependent: :destroy<br>
-has_many :comments, dependent: :destroy<br>
-attachment :profile_image<br>
-has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy<br>
-has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy<br>
-has_many :following_user, through: :follower, source: :followed<br>
-has_many :follower_user, through: :followed, source: :follower<br>


## tweets(投稿情報） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
-belongs_to :user<br>
-has_many :comments, dependent: :destroy<br>
-has_many :favorites, dependent: :destroy<br>
-has_one_attached :image<br>


## favorites(いいね機能) テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |


### Association

-belongs_to :user<br>
-belongs_to :tweet<br>


## comments(コメント） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |


### Association

-belongs_to :user<br>
-belongs_to :tweet<br>


## relationships(フォロー機能) テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| follower           | references | null: false, foreign_key: true |
| followed           | references | null: false, foreign_key: true |


### Association

-belongs_to :follower, class_name: 'User'<br>
-belongs_to :followed, class_name: "User"<br>
