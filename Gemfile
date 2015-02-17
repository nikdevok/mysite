source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



gem 'bootstrap-sass', '~> 3.2.0'
#gem 'ckeditor'
gem "wysiwyg-rails"
gem "font-awesome-rails"
gem 'paperclip'
gem 'fancybox-rails'
gem 'autoprefixer-rails'


gem 'devise'

gem 'simple_captcha', :git => 'git://github.com/rubymaniac/simple-captcha'
# Gems used only for assets and not required
# in production environments by default.gem 'simple_captcha', :git => 'git://github.com/rubymaniac/simple-captcha'

group :assets do
  gem 'sass-rails', '>= 3.2'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
   #gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '3.1.1'

gem 'quiet_assets', group: :development

gem 'cancan'
gem "twitter-bootstrap-rails"
gem 'devise-bootstrap-views'

gem 'rails_12factor', group: :production

#gem 'sqlite3'
gem "slim-rails"
gem "simple_form"
gem "strong_parameters"
gem 'pg'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
#gem 'capistrano'
#gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'

#Testing
gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end


group :development, :test do
  # ...
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-livereload'
end
