# Personal website

Source: <https://github.com/jackyzha0/quartz>

If you don't want to pollute your machine with a `node` installation, you can use the docker dev tools:

- Build and serve locally: `docker compose up`
- Dev shell: `docker compose run -P --rm dev-server bash`. Avoid `npx quartz update` and `sync` in the container, they require setting safe dir, username and email in `.gitconfig`. Just use `git` outside to merge upstream changes or push to your origin.
