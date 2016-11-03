require 'capybara/rspec'
require 'json'
require './libs/common'

require_dir('./config')
require_dir('./libs')

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 5

def click_on(*args) ; end
