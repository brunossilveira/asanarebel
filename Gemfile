source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "httparty"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"

group :development, :test do
  gem "dotenv-rails"
  gem "pry-byebug"
end

group :test do
  gem "rspec-rails"
  gem "webmock"
end

group :development do
  gem "spring"
end
