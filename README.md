# setup

    bundle

# 実行

    bundle exec app.rb

http://localhost:4567 をブラウザで開く


# コードゴルフ

router.rb を短くする

## レギュレーション

* 変更可能なファイルは `router.rb` のみとする。それ以外のファイルを変更しないこと
* クラス名 =  Router は変えないこと
* Router.route!() のメソッドは消さないこと、引数は初期実装を維持すること
* ユニットテスト `bundle exec rspec runner_spec.rb` が通ること
