# アプリケーション名
Memory 〜あなたの今をここに〜

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
・新規投稿・投稿一覧<br>


[![Image from Gyazo](https://i.gyazo.com/709aebda818b4974ac53505b7aec8800.gif)](https://gyazo.com/709aebda818b4974ac53505b7aec8800)<br>
・投稿詳細ページ<br>


[![Image from Gyazo](https://i.gyazo.com/82e3eb9ab3b877bd791e3f0d8e8d10d3.png)](https://gyazo.com/82e3eb9ab3b877bd791e3f0d8e8d10d3)<br>
・マイページ<br>


[![Image from Gyazo](https://i.gyazo.com/ce7373364df025104568cc09dcd33a7c.gif)](https://gyazo.com/ce7373364df025104568cc09dcd33a7c)<br>

# 実装予定の機能
・マークダウンでの記述<br>
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

・アプリ名（Memory）<br>
学んだことや日常の出来事等、なんでも記録してほしい、という気持ちから名付けました。
サブタイトルの「〜あなたの今をここに〜」は、日常の出来事はもちろん、今自分がどのレベルなのかこれまでどのようにスキルアップしてきたかを投稿してほしいという意味でつけました。

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
