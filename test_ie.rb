require 'bundler/setup'

Bundler.require

Capybara.register_driver :ie do |app|
  # remote
  # ie = Selenium::WebDriver::Remote::Capabilities.ie

  # Capybara::Selenium::Driver.new app, {
  #   browser: :remote,
  #   # url:     'http://192.168.1.107:5555',
  #   url:     'http://2.38.0.0:5555',
  #   desired_capabilities: ie
  # }

  # path が通っている場合
  Capybara::Selenium::Driver.new(app, browser: :ie)
end

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:ie)

session.visit '/'

session.save_screenshot 'hello_google.png'
