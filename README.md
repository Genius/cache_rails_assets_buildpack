## What does this buildpack do?

This buildpack is used for caching and restoring rails assets between heroku builds.

### Usage

There are two tags in this repository, one for caching assets and one for restoring the cache.

Add a buildpack with the `{current tag version}-restore_rails_assets` tag before the official `heroku/ruby` buildpack and one with the `{current tag version}-save_rails_assets` tag after the ruby buildpack.

To generate a new release use the `rake release` task.

### Things to note

This buildpack does not handle the cacheing of the `node_modules` directory. This is handled by the official `heroku/nodejs` buildpack.

If you are experiencing issues regarding the caching of `node_modules` ensure that the `NODE_MODULES_CACHE` env var is set to `true` and that `"cacheDirectories": ["node_modules"]` is included in your `package.json`
