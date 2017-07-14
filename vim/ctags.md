# Ctags

## Installation

install exuberant ctags

```brew install ctags-exuberant```

make sure that it appears in the path before the BSD program of the same name

```
-> % which -a ctags
/usr/local/bin/ctags
/usr/bin/ctags
```
follow Tim Pope's [instructions](http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html)

## Commands

### Indexation

to index the app

```
ctags -R .
```

to index `gem-ctags` then run `gem ctags` in the terminal to index all the methods within your gems

to index ruby methods, install `rbenv-ctags` with homebrew. then run `rbenv ctags` within your terminal

once the hooks are created, use `git init` to apply the templates to the repository
use it on any repository created before the hooks
and `git ctags` to index the repository

### Navigation

+ Go to
`C - ]`

+ Show a list of matches
`gC - ]`

+ Go back
`C - o`

### Search

+ `:tag {keyword}`
jumps to the first match
+ `:tjump {keyword}`
prompts with a list of matches


