Mementodoist
============

Installation
------------

### 1. Clone the repo:

```
git clone <this repo>
```

### 2. Add something like this to your cron:

```
00 23 * * * export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/bin:$PATH"; eval "$(rbenv init -)"; cd $HOME/quoteoftheday/ && bundle exec ruby main.rb
```

License
-------

MIT.
