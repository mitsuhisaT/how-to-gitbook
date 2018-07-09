# gitbook Usage
Write how to use `gitbook-cli`.

You can read Japanese [README.jp.md](README.jp.md).

## about GitBook
[GitBook](https://www.gitbook.com)  can easily create ebooks such as HTMLs, PDF and ePUB from Markdown file. 

[about](https://www.gitbook.com/about) is described as   
> GitBook started mid-2014 as an open-source tool for developers to build documentation. 
> Today we empower teams of all sizes to build great internal & external docs.


GitBook is a cloud service now,
but you can create a standalone environment using a [gitbook-cli](https://github.com/GitbookIO/gitbook-cli).

The GitBook development base is located in Lyon, a beautiful city from French Alps 1 hours ago. 

# Preparation
----
GitBook is a tool that uses NODE.js, so make sure you have an environment where NODE.js can be used in advance. 

You can install NODE.js directly, but it is more convenient to introduce a mechanism to easily switch between versions that you use. 

## NODE.js Environment

### macOS
Using macOS. 

- Install [Homebrew](https://brew.sh/index). 
- Install [nodebrew](https://github.com/hokaccha/nodebrew). 

nodebrew installation can be installed in this way, not the installation method described on Github above. 

```shell
$ brew install nodebrew
```
### MS-Windows
Using Microsoft Windows. 

- Install [Scoop](https://scoop.sh/) 
- Install [nvm](https://github.com/creationix/nvm)

## yarn Installation
Then install yarm instead of npm. 

macOS  
```shell
$ brew install yarn
```

MS-Windows  
```shell
> scoop install yarn
```

# Install `gitbook-cli`
----
It's at last. 

```shell
$ yarn global add gitbook-cli
```

The command line tool is `add` to `global`. 
If you are using _npm_, execute the following command:   

```shell
$ npm install --global gitbook-cli
```

## Check
Run `gitbook --help` and the gitbook-cli installation was successful as follows: 

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

# Initialize
----

```
$ gitbook init directory
```

For more information on how to use GitBook, see [GitBook Tools Chain document](https://toolchain.gitbook.com). 

# Plugins
----
GitBook has some [plug-ins](https://toolchain.gitbook.com/plugins/) that enables you to implement enhancements. 

GitBook plugins can be found on [GitBook Plugins](https://plugins.gitbook.com) Site. 

However, there are many things to say, such as apology, lack of information, or something to do. 

The recommended plug-in is GitBook 

- [Collapse Table of Contents](#summary-Folding) 
- [Page Contents](#navigator) 
- [UML Description](#uml) 

## SUMMARY Folding
Documents created in GitBook have a table of contents on the left side of the screen. 
If you have a long sentence, there will be many contents items, so do you want to fold it? 
This is the plug-in for the expand system.  Some are registered, but I think the `expand-active-chapter` is good. 

Add `plugins` on `book.json`. 

```json
{
  "plugins": ["expand-active-chapter"]
}
```

Install. 

```shell
$ gitbook install
```

## Page TOC 
Displays the Table of Contents (TOC) at the top of the page. 

Add `plugins` on `Book.json`. 

```json
{
  "plugins": ["navigator"],
}
```

Install. 

```shell
$ gitbook install
```

## UML
You can draw a UML diagram of UML in a text editor, using a [PlantUML](http://plantuml.com/). 
In GitBook, you can also deploy a plug-in to place UML created in an inline or another file in a document. 
A different plug-in will hit the [GitBook Plugins](https://plugins.gitbook.com). 

You can use this plugin to specify character code and format on `book.json`. 

First install the NODE module `gitbook-plugin-uml`. 

```shell
$ yarn add gitbook-plugin-uml
```
Add `plugins` on `Book.json`. 

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

Install. 

```shell
$ gitbook install
```

## Install plug-in
The following is a description of the `Book.json` when deploying 3 types of plugins: 

```json
{
  "plugins": [
    "expand-active-chapter",
    "navigator",
    "uml"
  ],
  "pluginsConfig": {
    "uml": {
      "charset": "utf-8",
      "format": "svg"
    }
  }
}
```

# Generating eBooks and PDFs
`gitbook-cli` - You cannot generate ePub or PDF files. 
See [Generating eBooks and PDFs](https://toolchain.gitbook.com/ebook.html) and install [calibre](https://calibre-ebook.com). 
`calibre` is a free ebook management tool. 

> calibre is a powerful and easy to use e-book manager.

In addition, you are outputting UML in SVG format,
so you will need [svgexport](https://github.com/shakiba/svgexport) to generate ePub and PDF. 

## Install calibre
Download from [Download Site](https://calibre-ebook.com/download), and install the installer in your environment. 

### macOS Additional Configuration
Create symbolic links for `ebook-convert`.
I can't make it described method in [Generating eBooks and PDFs](https://toolchain.gitbook.com/ebook.html)),
I made in **/usr/bin**. 

```shell
$ sudo ln -s /Applications/calibre.app/Contents/MacOS/ebook-convert /usr/local/bin
```

## svgexport Installation
svgexport is a Node.js module and command-line tool for exporting SVG files to PNG and JPEG, it uses PhantomJS for rendering SVG files.

If you want to output ePub and PDF in GitBook, use it as a command-line tool, so install it as follows :.   

```shell
$ yarn global add svgexport
```

## Sample
We have provided an example of deploying simple UML and GUI design tools in the `sample` directory.  Please refer to it. 
