require 'bundler/setup'

Bundler.require

Capybara.register_driver :trifleJS do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--emulate:IE8'])
end

##
#  Override constants for trifleJS
Capybara::Poltergeist::Client::PHANTOMJS_NAME = 'TrifleJS.exe'
Capybara::Poltergeist::Client::PHANTOMJS_VERSION = ['>= 1.0.0']

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:trifleJS)

session.visit '/'

session.save_screenshot 'hello_google.png'
