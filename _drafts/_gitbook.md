# GitBook

GitBook is a CLI for building books via git, GitHub, and Markdown. The GitBookIO
team has deprecated its CLI, and are focusing their efforts on the gitbook.com
platform ($40/mo, $480/yr). What open source alternatives exist for this tool?
Is it worth using an open source fork of the GitBook project?

## Explore using GitBook

* [Nikita Voloboev's GitBook](https://github.com/nikitavoloboev/knowledge)
* [GitBook Plugins](https://github.com/swapagarwal/awesome-gitbook-plugins)

### Possible workflow

* Write documentation with Markdown
* Organize with GitBook
* Version Control with git (.gitignore `_book` folder)
* Publish to GitHub Pages

### GitBook CLI

```bash
$ mkdir example-gitbook && cd $_
$ npm install -g gitbook-cli
$ gitbook init
$ gitbook serve --watch
$ gitbook build  # build static site
$ gitbook build ./ --log=debug --debug  # for debugging
$ gitbook --help  # cli tool help (set version, uninstall, etc)
$ gitbook help  # build, serve, install plugins, init, build pdf/epub/mobi
```

### GitBook Organization

Write content in markdown. Organize your content into folders. Use `SUMMARY.md`
to create a "table of contents" for your content, and set the order of content. 
Use `README.md` as the "landing page" for this GitBook.

```md
# Summary

Table of Contents goes here.

* [Astral Projections](topic-astral-projections/index.md)
  - [How To](topic-astral-projections/how-to.md)
* [Chemtrails](topic-chemtrails/index.md)
  - [What are They?](topic-chemtrails/what-are-they.md)
  - [Government Weather Modification](topic-chemtrails/government-weather-modification.md)
...
```

### Publish to GitHub Pages

`bin/publish` script

```bash
#!/usr/bin/env bash
set -e

# source: https://gist.github.com/SangsooNam/aa73c3e1ff88d30433e4020f1275242a

gitbook install && gitbook build
git checkout gh-pages
git pull origin gh-pages --rebase
cp -R _book/* .
git clean -fx node_modules
git clean -fx _book
git add .
git commit -a -m "Update GitHub Pages $(date +%Y%m%d%H%M%S)"
git push origin gh-pages
git checkout master
```

Visit the published documents at <https://username.github.io/repository-name>.

Repository can be made private, and GitHub Pages will still serve the content.

## Explore using mdBook

todo

## Explore using docsify

todo

## Alternatives

* [mdBook](https://github.com/rust-lang/mdBook)
* [docsify](https://docsify.js.org/#/)
* [hugo](https://github.com/gohugoio/hugo)
* [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki)
* [BookStack](https://www.bookstackapp.com/)
* [daux.io](https://github.com/dauxio/daux.io)
* [gollum](https://github.com/gollum/gollum)
* [softcover](https://github.com/softcover/softcover)

## Other Interesting Items

* [mermaid-js](https://github.com/mermaid-js/mermaid) - generate diagrams from text
