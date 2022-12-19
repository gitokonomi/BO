# B-match

### サイトテーマ
ボードゲームを遊ぶための、カフェ・スペースを中心とした相席マッチングサービスです。

### テーマを選んだ理由
2022年時点で国内ボードゲームカフェは500店舗以上に上り、新規店舗も年々、新しく展開されています。
しかしながら、同時になくなってしまうボードゲームカフェも多くあります。
そんなお店を少しでも減らし、お店に行く入口の一つとして利用できるサイトを作りたいと考えました。
また、既存にマッチングサービスは存在しましたが、webアプリではない事、欲しい機能がなかったので作成しております。

### ターゲットユーザ
- ボードゲームを遊びたいけど遊び方がわからない人
- カフェに行った事がないので誰かと一緒に行きたい人
- とにかく今すぐボードゲームで遊びたい人

### 主な利用シーン
- ボードゲームカフェやスペースでの相席を募りたい時
- 遊びたいゲームがあるが友達との都合がつかない
- 好きなゲームが同じ人同士で繋がりたい


## 実装機能

| 機能名 | 説明 | ゲストログイン時利用可否 |
|:---|:---|:---|
| **会員** |||
| ログイン機能 | ・メールアドレス、パスワードでログインできる。 ・ログイン時のみ利用できる機能が利用できるようになる。|×|
| ログアウト機能 | ・ログインしている状態からログアウト状態にする。 ・ログイン時のみ利用できる機能が利用できなくなる。|×|
| 投稿一覧表示機能 | ・投稿を一覧表示する。 ・検索結果を表示する場合は、検索条件に当てはまる投稿のみ一覧表示する。|○|
| 投稿詳細情報表示機能 | ・投稿の詳細表示する。|○|
| 会員情報登録機能 | ・会員情報の登録ができる。 |×|
| 会員情報編集機能 | ・登録している情報を編集することができる。|×|
| いいね機能 | ・投稿に対していいね（ブックマーク）する事ができる。 |×|
| いいね一覧機能 | ・いいね（ブックマーク）した投稿を一覧表示する。 |×|
| コメント機能 | ・投稿に対してコメントができる。|×|
| フォローフォロワー機能 | ・特定の会員をフォローする事ができる。 |×|
| ユーザ検索機能 | ・ユーザー名で検索ができる。 |○|
| キーワード検索機能 | ・キーワードで検索ができる。 |○|
| 検索機能 | ・タグ（エリア名）で検索ができる。 |○|
| 通知機能 | ・マッチングした時に通知が来るようにできる。 |○|


| 機能名 | 説明 |
|:---|:---|
| **管理者** ||
| ログイン機能| ・メールアドレス、パスワードでログインできる。 ・ログイン時のみ利用できる機能が利用できるようになる。|
| ログアウト機能| ・ログインしている状態からログアウト状態にする。 ・ログイン時のみ利用できる機能が利用できなくなる。|
| 投稿一覧表示機能| ・過去の投稿を一覧で確認することができる。|
| 投稿詳細表示機能| ・投稿の詳細を確認することができる。|
| 会員一覧表示機能| ・会員情報を一覧で確認することができる。|
| 会員詳細情報表示機能| ・会員の詳細情報を確認することができる。 ・会員のステータス(有効/退会)を切り替えることができる。|
| タグ設定機能| ・タグ（エリア名）の追加・編集・削除を行うことができる。|


## 設計書


## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby 3.1.2,SQL
- フレームワーク：Ruby on Rails 6.1.2
- JSライブラリ：jQuery
- IDE：Cloud9
- Gems
  - devise
  - bootstrap-sass 4.5.3
  - kaminari 1.2.1
  - bootstrap5-kaminari-views 0.0.1
  - dotenv-rails
  - net-smtp
  - net-pop
  - net-imap
