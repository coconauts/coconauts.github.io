# Using docker


## Install

    docker-compose build

## Preview

    docker-compose up

## Create a new post

    docker-compose run blog rake new_post['Foo']

## Deploy

    docker-compose run blog ./deploy


# (OLD) Deploying Octopress on Github pages

[Full documentation](http://octopress.org/docs/deploying/github/)

### Setup octopress + rake

* First clone the repository
* Checkout `source` branch
* Folow the [setup octopress guide](http://octopress.org/docs/setup/)
```
sudo gem install bundler
bundle install
bundle exec rake install
```

### Github pages setup

    rake setup_github_pages

Link to our github `git@github.com:coconauts/coconauts.github.io.git`

### Deploy

```
bundle exec rake generate
bundle exec rake deploy
```
