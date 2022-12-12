# php-ready (phpr)


build local image `docker build github.com/makinuk/php-ready -t phpr`

## Examples:

create project with composer

```
docker run --rm --interactive --tty \
  --volume $PWD:/app/src \
  phpr <command>
```
