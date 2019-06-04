---
description: appendix
---
# Appendix

## SNS系のリンクを消す
各ページの右上に表示される SNS系のリンクボタンを押す消す方法です。

詳細は、[plugin-sharing](https://github.com/GitbookIO/plugin-sharing) を参照してください。

### 全部消す
book.json の `plugins` に、つぎの様に記述します。

```json
{
  "plugins": ["-sharing"]
}
```

デフォルトのプラグイんなので `gitbook install` は不要です。

### 個別に選ぶ
個別に設定することも可能です。book.json の `pluginsConfig` に、つぎの様に記述します。

```json
{
  "pluginsConfig": {
    "sharing": {
      "facebook": false,
      "twitter": false,
      "google": true,
      "weibo": false,
      "instapaper": false,
      "vk": false,
      "all": [
        "facebook", "twitter", "google", "weibo", "instapaper", "vk"
      ]
    }
  }
}
```

## 「GitBookで公開」を消す
左側の目次の下部に表示される [GitBookで公開](https://www.gitbook.com/) を消す方法は、プラグインを利用します。

book.json の `plugins` に、つぎの様に記述します。

```json
{
  "plugins": ["hide-published-with"]
}
```

`gitbook install` でプラグインをインストールしてください。

## favicon設定
GitBookの標準の **favicon** を変更するには、プラグインを利用します。
[gitbook-plugin-custom-favicon](https://github.com/Bandwidth/gitbook-plugin-custom-favicon) を導入しました。  

book.json の `plugins` に、つぎの様に記述します。

```json
{
  "plugins": ["custom-favicon"],
  "pluginsConfig": {
    "favicon": "./assets/images/icon/favicon.ico"
  }
}
```

`gitbook install` でプラグインをインストールしてください。

## LOGO画像設定
[GitBook plugin:Insert logo](https://github.com/matusnovak/gitbook-plugin-insert-logo) を利用すると、左側のサマリーの上部にロゴ画像を挿入することが

book.json の `plugins` に、つぎの様に記述します。

```json
{
  "plugins": [ "insert-logo"],
  "pluginsConfig": {
    "insert-logo": {
      "url": "/assets/images/mitsuhisaT_logo_L.png",
      "style": "background: none;"
    }
  }
}
```

`gitbook install` でプラグインをインストールしてください。

## 多言語
Gitbook は、多言語対応しています。それぞれの言語のコンテンツを準備する必要はありますが、自動翻訳が充実してきているので、かなり敷居低くなりました。

### 主言語の設定
book.json の `language` に、主言語の設定をします。日本語の場合は、`ja` とします。
指定するコードは [ISOコード](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) です。

この設定を行うと、前記で説明した目次の下部の ”Published with GitBook" が 「GitBookで公開」になります！

```json
{
  "language": "ja"
}
```

コンテンツは、言語コードと同じ名前のディレクトリを準備し、その下に保存します。

他の設定については、
[Configuration](https://toolchain.gitbook.com/config.html)
を参照してください。

以下の説明は、多言語対応する場合に必要です。
### 多言語化
LANGS.md を用意する。

| ディレクトリ | ファイル名 | 内容 |
|:-- |:-- |:-- |
| en | | 英語コンテンツのホームディレクトリ |
| | SUMMARY.md | 目次 |
| | README.md | 本文 |
| | GLOSSARY.md | 用語集 |
| jp | | 日本語コンテンツのホームディレクトリ |
|  | SUMMARY.md | 目次 |
|  | README.md | 本文 |
|  | APPENDIX.md | 附録(本文章) |
|  | GLOSSARY.md | 用語集 |
| .bookignore | | リリースに含めないファイルのリスト |
| book.json | | GitBook 設定ファイル |
| LANGS.md | | 言語選択 |
| package.json | | NODE.js 設定ファイル |

なお、PDFやePubは、準備した言語毎に生成されます。**すごい**。
