require 'bundler/setup'

Bundler.require

##
#  :see_no_evil:
def Cliver::detect!(*args)
  File.join(__dir__, args[0])
end

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
