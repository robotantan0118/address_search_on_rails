# address_search_on_rails

## rails console上での動作結果

*  全住所出力
```
$ AddressSearchService.new.all
```
* 住所検索
```
$ AddressSearchService.new.search(検索KEYWORD)
```

## ブラウザ上での動作結果

* 前提条件
** 以下のコマンドをコンソール上で実行
```
$ rails s
```
** ブラウザ上でのアクセスURL
`localhost:3000`

* 検索KEYWORDを画面上部のテキストボックスに入力　→　検索
**  検索KEYWORDをもとに結果を検索ボタン配下のテーブルに反映
** 検索hit数（総数）を表示

* 検索結果の表示内容
CSVのKEN_ALL.csvの内容をもとに以下の内容を表示
** csvのデータ
*** CSV形式で表示
** 郵便番号
** 都道府県
** 市区町村
** その他
