# AssetsRouterRails

RailsのAssetsPipelineにルーティング機能を追加したりRailsっぽいController、Actionをcoffeescriptで作成するGeneratorを提供します

## Target

Railsを使う上でAssetsPipeline内のディレクトリ構成やルーティングをどうやるか決めかねている人

## Install

```ruby
gem 'assets_router_rails'
```

## Functions

* パスベースでのルーティング機能
* coffeescriptでcontroller、action作成
* controller、actionに基づいたstylesheets、imagesディレクトリ、ファイルの生成
* rails_config連携
* namespace管理
* その他雑多なディレクトリ生成

## How to use

### install

```
rails g(enerate) assets_router_rails:install
```

```
       exist  app/assets/javascripts
      create  app/assets/javascripts/application.js
   identical  app/assets/javascripts/config/routes.coffee
   identical  app/assets/javascripts/config/settings.js.erb
   identical  app/assets/javascripts/controllers/application_controller.coffee
   identical  app/assets/javascripts/main.coffee
   identical  app/assets/javascripts/modules/Router.coffee
   identical  app/assets/javascripts/ns.coffee
       exist  app/assets/stylesheets
      create  app/assets/stylesheets/application.css.sass
   identical  app/assets/stylesheets/common/_animation.sass
   identical  app/assets/stylesheets/common/_common.sass
   identical  app/assets/stylesheets/common/_extends.sass
   identical  app/assets/stylesheets/common/_functions.sass
   identical  app/assets/stylesheets/common/_mixins.sass
   identical  app/assets/stylesheets/common/_sprite.sass
   identical  app/assets/stylesheets/common/_variables.sass
```

### generate

```
rails g(enerate) assets_router_rails:controller user index show new edit
```

```
      create  app/assets/javascripts/controllers/user_controller.coffee
      insert  app/assets/javascripts/controllers/user_controller.coffee
      append  app/assets/javascripts/config/routes.coffee
      create  app/assets/stylesheets/page/user
      create  app/assets/stylesheets/page/user/_index.sass
      create  app/assets/stylesheets/page/user/_show.sass
      create  app/assets/stylesheets/page/user/_new.sass
      create  app/assets/stylesheets/page/user/_edit.sass
      append  app/assets/stylesheets/application.css.sass
      create  app/assets/images/user
      create  app/assets/images/user/index
      create  app/assets/images/user/show
      create  app/assets/images/user/new
      create  app/assets/images/user/edit
```

### destroy

```
rails d(estroy) assets_router_rails:controller user
```

```
      remove  app/assets/javascripts/controllers/user_controller.coffee
    subtract  app/assets/javascripts/config/routes.coffee
      remove  app/assets/stylesheets/page/user
    subtract  app/assets/stylesheets/application.css.sass
      remove  app/assets/images/user
```

## Problem

* rails_config連携の有無の選択
* http methodを区別したルーティング
* stylesheetsの自動ルーティング
* 言語の選択(javascript or coffeescript, sass or scss)

## Author

c67n9v6l9

Email: c67n9v6l9@gmail.com

Twitter: https://twitter.com/c67n9v6l9
