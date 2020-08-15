Mementodoist
============

This script creates a TODO item for tomorrow in your Todoist account.

Installation
------------

### 0. Get a Todoist API token:

Learn how to get one [here](https://developer.todoist.com/sync/v8/#authorization).

### 1. Clone the repo:

```
git clone git@github.com:juliend2/mementodoist.git
```

### 2. Add something like this to your cron:

```
00 23 * * * export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/bin:$PATH"; eval "$(rbenv init -)"; cd $HOME/quoteoftheday/ && bundle exec ruby main.rb
```

License
-------

MIT.
