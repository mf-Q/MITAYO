# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## 機能内容
鑑賞した映画やTVドラマなどを一覧にして記憶できるアプリ。
いつどこで、何回観たかを詳細で確認できる。
基本的に個人で使用する鑑賞作品管理メモアプリ。

- 会員登録ができる。
- タイトルと鑑賞日が一覧で表示される。
- 詳細ページではどこでみたか、ジャンル、何回見たかが確認でき、メモ書きができる。
- 検索機能付き

## users テーブル
| Column | Type | Options     |
|--------|------|-------------|
|name|string|null: false,unique: true  |
|email|string|null: false,unique: true  |
|pass |string|null: false     |


### Association
- has_many:products

## products テーブル
| Column | Type | Options     |
|--------|------|-------------|
|title|string|null: false,unique: true  |
|genre |string|null: false |
|timing |date||
|place |string|null: false |
|number |integer|default:1|
|content|text|  |
|user_id|integer|null: false |

### Association
- belongs_to:user