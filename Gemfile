# frozen_string_literal: true
# A sample Gemfile
source "https://rubygems.org"

def windows?
  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
end

if windows?
  gem 'nokogiri', '1.6.8.rc3'
else
  gem 'nokogiri'
end
gem 'rails'
gem 'paperclip'
gem 'rubyzip'
if !windows?
  gem 'unicorn'
end
gem 'omniauth'
gem 'omniauth-facebook'
gem 'geocoder'
