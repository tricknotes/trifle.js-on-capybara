require 'bundler/setup'

Bundler.require

##
#  Override constants for trifleJS
Capybara::Poltergeist::Client::PHANTOMJS_NAME = 'TrifleJS.exe'
Capybara::Poltergeist::Client::PHANTOMJS_VERSION = ['~ 1.7.0']

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:poltergeist)

session.visit '/'

session.save_screenshot 'hello_google.png'
