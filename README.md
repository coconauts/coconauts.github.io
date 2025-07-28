## Install

    docker-compose build

## Preview

    docker-compose up

or 

    dc run --service-ports blog

and open http://localhost:4000/blog

# Generate new coconauts.net certificate with let'sencrypt

```
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
sudo ./letsencrypt-auto certonly -a manual -d coconauts.net
```

Now let's encrypt will ask you to display a file on the webserver.

Add new file on .source/.well-known and publish the blog 
Check the file and then Continue with the certificate

Go to pages settings https://gitlab.com/coconauts/coconauts.gitlab.io/pages
Remove existing coconauts.net domain

Add new domain, attach fullchain.pem and privkey.pem 

### Setup octopress + rake (without docker)

* First clone the repository
* Checkout `source` branch
* Folow the [setup octopress guide](http://octopress.org/docs/setup/)
```
sudo gem install bundler
bundle install
bundle exec rake install
```

### Deploy

Just push master to gitlab , and the CI will compile and deploy on gitlab pages

