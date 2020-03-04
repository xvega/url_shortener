# URL SHORTENER

# Dependencies: 
[docker](https://docs.docker.com/docker-for-mac/install/) - Docker is a full development platform to build, run, and share containerized applications.

## How to run the app?

You only have to run this single command, a script will take care of the db creation for test and dev environments and the migrations.
    
```sh
$ docker-compose run app
```

## How to run the test suite?

```sh
$ docker-compose run app bundle exec rspec spec/
```
