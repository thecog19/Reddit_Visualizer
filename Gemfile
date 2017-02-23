source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'figaro', '~> 1.1'
gem 'httparty', '~> 0.14'
gem 'jquery-rails'
gem 'delayed_job_active_record'
gem 'uglifier', '~> 3.0', '>= 3.0'
gem 'jbuilder', '~> 2.6'
gem 'angularjs-rails', '~> 1.6'
gem 'bootstrap-sass', '~> 3.3'
gem 'reddit_api'

source 'https://rails-assets.org' do
  gem 'rails-assets-ui-router', '~> 0.4'
  gem 'rails-assets-lodash', '~> 4.17'
  gem 'rails-assets-restangular', '~> 1.6'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-rails', '~> 0.3'
  gem 'jasmine', '~> 2.5'
end

group :development do
  gem 'listen', '~> 3.0'
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'guard-rspec', '~> 4.7'
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller', '~> 0.7'
  gem 'jazz_fingers', '~> 4.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'vcr', '~> 3.0'
  gem 'webmock', '~> 2.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
