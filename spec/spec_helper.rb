require 'capybara/rspec'
require 'selenium-webdriver'
require 'browsermob-proxy'
require 'json'
require './libs/common'
require './libs/server'

require_dir('./config')
require_dir('./libs')

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10

# Capybara.register_driver :selenium do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#
#   # Configure proxy manually.
#   profile['network.proxy.type'] = 1
#   profile['network.proxy.http'] = 'localhost'
#   profile['network.proxy.http_port'] = 8080
#
#   Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)
# end


RSpec.configure do |config|
  config.before(:suite) do
    @server = BrowserMob::Proxy::Server.new('./browsermob-proxy-2.1.2/bin/browsermob-proxy')
    @server.start
    $proxy = @server.create_proxy
    # $proxy.new_har 'pitneybowes'
  end

  config.after(:suite) do
    har = $proxy.har
    #har.entries.map{|entry| puts entry.request}
    har.save_to './pitney.har'
    $proxy.close
  end
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.proxy = $proxy.selenium_proxy

  Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)
end

def click_on(*args) ; end
