require 'bundler/setup'

Bundler.require

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:poltergeist)

session.visit '/'

session.save_screenshot 'hello_google.png'
