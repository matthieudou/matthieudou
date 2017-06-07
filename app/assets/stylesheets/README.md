# Assets-Materialize

## Setup

Ensure you have the following gems in your Rails `Gemfile`

```ruby
# Gemfile
  gem 'materialize-sass'
  # importing the materialize framework
  gem 'material_icons'
  # importing the material icons from google

  gem 'simple_form'
  gem 'font-awesome-sass'
  gem 'autoprefixer-rails'
```

Run `bundle install`

```shell
  bundle install
```

Replace Rails' generated stylesheets by custom stylesheets:

```shell
  $ rm -rf app/assets/stylesheets
  $ curl -L https://github.com/matthieudou/assets-materialize/archive/master.zip > stylesheets.zip
  $ unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/assets-materialize-master app/assets/stylesheets
```

Don't forget the sprockets directives in `assets/javascripts/application.js`

```shell
  // app/assets/javascripts/application.js

  //= require jquery
  //= require jquery_ujs
  //= require materialize
  //= require materialize/extras/nouislider
  //= require_tree .
```

And the viewport in the layout

```html
  <!-- app/views/layouts/application.html.erb -->
  <head>
    <!-- Add these line for detecting device width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  </head>
```

In your terminal, generate the `simple_form config.

```shell
$ rails generate simple_form:install
```

Then, you'll need to add the materialize config for `simple_form`

```shell
  rm -rf config/initializers/simple_form.rb
  curl -L https://raw.githubusercontent.com/matthieudou/rails-initialize/master/config_files/simple_form.rb > config/initializers/simple_form.rb
```

## Adding new `.scss` files

Look at your main `application.scss` file to see how SCSS files are imported.


For each folder (**`components`**, **`layout`**, **`pages`**, **`vendor`**), there is one `_index.scss` partial which is responsible for importing all the other partials of this folder.

**Example 1**: Let's say you add a new `_contact.scss` file in **`pages`** then you have to modify `pages/_index.scss` as:

```scss
// pages/_index.scss
@import "home";
@import "contact";
```

**Example 2**: Let's say you add a new `_sidebar.scss` file in **`layout`** then you have to modify `layout/_index.scss` as:

```scss
// layout/_index.scss
@import "base";
@import "utilities";
@import "footer";
@import "navbar";
@import "sidebar";
```

<!-- If no need for font-awesome -->
## `Font-awesome`

By default, the `font-awesome` icons are imported. If you don't want them, you have to remove:

- In the `Gemfile`

```ruby
# Gemfile
gem 'font-awesome-sass'
```

- And in the `application.scss`

```scss
// assets/application.scss
@import "font-awesome-sprockets";
@import "font-awesome";
```

<!-- end if no need for font-awesome -->
