# gitbookの使い方
`gitbook-cli` の使い方を書きます。

## GitBook について
[GitBook](https://www.gitbook.com) は、Markdown形式で作成した文章を HTML形式、PDF形式、ePub形式などの電子ブックを簡単に作ることができます。

[about](https://www.gitbook.com/about) には、  
> GitBookは、開発者のドキュメント作成のためのオープンソースツールとして2014年半ばにスタートしました。
> 今日では、あらゆる規模のチームに対して、優れた内部と外部のドキュメントを構築する能力を強化しています。

と記述されています。

GitBook は、クラウドサービスですが、
[gitbook-cli](https://github.com/GitbookIO/gitbook-cli) を利用して、スタンドアロンで生成する環境を構築できます。

GitBook の開発拠点は、フランスアルプスから 1時間ほどの美しい都市リヨンにあります。  

# 準備
----
GitBook は NODE.js を利用したツールなので予め NODE.js を利用できる環境を整えてください。  

NODE.js を直接インストールしても良いですが、利用するバージョンを簡単に切り替えらる仕組みを導入した方が便利です。

## NODE.js 環境

### macOS
macOS を利用している方は、

- [Homebrew](https://brew.sh/index_ja) をインストール
- [nodebrew](https://github.com/hokaccha/nodebrew) をインストール

nodebrew のインストールは、上記の Github に記述されているインストール方法ではなく

```shell
$ brew install nodebrew
```
でインストールできます。

### MS-Windows
Microsoft Windows を利用している方は、

- [Scoop](https://scoop.sh/) をインストール
- [nvm](https://github.com/creationix/nvm) をインストール

## yarn のインストール
それから、npm の代わりに yarm をインストールしておきましょう。

macOS  
```shell
$ brew install yarn
```

MS-Windows  
```shell
> scoop install yarn
```

# `gitbook-cli` のインストール
----
やっと本題です。

```shell
$ yarn global add gitbook-cli
```

コマンドラインツールは、`global` に `add` するのがお約束です。  
_npm_ を利用している方は、つぎのコマンドを実行します。 　

```shell
$ npm install --global gitbook-cli
```

## 確認
`gitbook --help` を実行し、つぎの様に表示されれば、gitbook-cli のインストールは成功しました。

```shell
$ gitbook --help

  Usage: gitbook [options] [command]


  Options:

    -v, --gitbook [version]  specify GitBook version to use
    -d, --debug              enable verbose error
    -V, --version            Display running versions of gitbook and gitbook-cli
    -h, --help               output usage information


  Commands:

    ls                        List versions installed locally
    current                   Display currently activated version
    ls-remote                 List remote versions available for install
    fetch [version]           Download and install a <version>
    alias [folder] [version]  Set an alias named <version> pointing to <folder>
    uninstall [version]       Uninstall a version
    update [tag]              Update to the latest version of GitBook
    help                      List commands for GitBook
    *                         run a command with a specific gitbook version

```

# 初期化
----

```
$ gitbook init directory
```

GitBook の詳しい使い方については [GitBook ツールチェーン ドキュメント](https://toolchain.gitbook.com) を参照してください。

# プラグイン
----
GitBook は、[プラグイン](https://toolchain.gitbook.com/plugins/) を導入し機能拡張を実現できます。  

GitBook のプラグインは、 [GitBook Plugins](https://plugins.gitbook.com) サイトより検索できます。
しかし、ちょっと記述内容に、謝りがあったり、情報が足りなかったり、するものが多いです。  

お勧めのプラグインは、  
- [目次の折りたたみ](#summaryの折畳み)
- [ページ目次](#ページにtoc)
- [UMLの記述](#uml) 

## SUMMARYの折畳み
GitBook で作成するドキュメントには、画面の左側に目次が付きます。  
長い文章になると目次項目が多くなり、折り畳みたくなりませんか？  
この要求を満たすのが expand系のプラグインです。いくつか登録されていますが `expand-active-chapter` が良いと思います。

`Book.json` の `plugins` に追加します。

```json
{
  "plugins": ["expand-active-chapter"]
}
```

インストールを行う。

```shell
$ gitbook install
```

## ページにTOC
TOC(Table of contents)をページ上部に表示します。

`Book.json` の `plugins` に追加します。

```json
{
  "plugins": ["page-toc"],
  "pluginsConfig": {
    "page-toc": {
      "position": "before-first",
      "showByDefault": true
    }
  }
}
```

インストールを行う。

```shell
$ gitbook install
```

## UML
[PlantUML](http://plantuml.com/) を利用するとテキストエディタなどで UML の各種ダイアグラム ＋ α の図を描けます。  
GitBookでも、プラグインを導入すると、インラインまたは、別ファイルで作成した UMLをドキュメント内に配置できます。  

[GitBook Plugins](https://plugins.gitbook.com) の検索では、別のプラグインがヒットします。  

このプラグインを使えば、`book.json` で、文字コード指定とフォーマット指定ができます。  

先ず、NODEモジュール `gitbook-plugin-uml` をインストールします。
```shell
$ yarn add gitbook-plugin-uml
```

`Book.json` の `plugins` に追加します。

```json
{
  "plugins": ["uml"],
  "pluginsConfig": {
    "uml": {
      "charset": "utf-8",
      "format": "svg"
    }
  }
}
```

インストールを行う。

```shell
$ gitbook install
```

## プラグインを纏めてインストール
個別に説明した、三種のプラグインを導入する場合の `Book.json` はつぎの通りです。

```json
{
  "plugins": [
    "expand-active-chapter",
    "page-toc",
    "uml"
  ],
  "pluginsConfig": {
    "page-toc": {
      "position": "before-first",
      "showByDefault": true
    },
    "uml": {
      "charset": "utf-8",
      "format": "svg"
    }
  }
}
```

# 電子ブックとPDFの生成
`gitbook-cli` 単体では、ePub形式の電子ブックやPDF形式のファイルの生成はできません。  
[Generating eBooks and PDFs](https://toolchain.gitbook.com/ebook.html) を参考に [calibre](https://calibre-ebook.com) をインストールします。  
`calibre` は、無料で利用できる電子ブックの管理ツールです。  

> calibre is a powerful and easy to use e-book manager.
> calibre は、強力で簡単に使える電子ブックマネージャーです。

さらに、UMLをSVG形式で出力しているので、ePub、PDFを生成するために
[svgexport](https://github.com/shakiba/svgexport) が必要になります。

## calibreのインストール
[ダウンロードサイト](https://calibre-ebook.com/download) から、利用環境にあったインストーラーを選びダウンロードし、インストールを行います。

### macOSの追加設定
`ebook-convert` のシンボリックリンクを作ります。[Generating eBooks and PDFs](https://toolchain.gitbook.com/ebook.html) に記述されている
_/usr/bin_ には、生成できなかったので、 **/usr/local/bin** に作りました。

```shell
$ sudo ln -s /Applications/calibre.app/Contents/MacOS/ebook-convert /usr/local/bin
```

## svgexportのインストール
svgexportは、SVGファイルをPNGとJPEGにエクスポートするNODE.jsのモジュール、かつコマンドラインツールで、SVGファイルのレンダリングにPhantomJSを利用しています。  
> svgexport is a Node.js module and command-line tool for exporting SVG files to PNG and JPEG, it uses PhantomJS for rendering SVG files.

GitBookでePub、PDFを出力する場合は、コマンドラインツールとして利用するので、つぎのようにインストールします。 　

```shell
$ yarn global add svgexport
```
## サンプル
`sample` ディレクトリに簡単な UML と GUI設計ツール を配置した例を用意しました。参考にしてください。  
