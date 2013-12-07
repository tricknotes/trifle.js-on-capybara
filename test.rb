require 'bundler/setup'

Bundler.require

Capybara.register_driver :trifleJS do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs: 'TrifleJS.exe', phantomjs_options: ['--emulate:IE8'])
end

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:trifleJS)

session.visit '/'

session.save_screenshot 'hello_google.png'
