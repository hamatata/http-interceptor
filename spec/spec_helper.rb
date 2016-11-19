require 'capybara/rspec'
require 'json'
require './libs/common'
require 'selenium-webdriver'
require './libs/server'

require_dir('./config')
require_dir('./libs')

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 5

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new

  # Configure proxy manually.
  profile['network.proxy.type'] = 1
  profile['network.proxy.http'] = 'localhost'
  profile['network.proxy.http_port'] = 8080

  Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)
end

def click_on(*args) ; end
