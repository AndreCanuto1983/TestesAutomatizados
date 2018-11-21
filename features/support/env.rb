require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'capybara/cucumber'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Capybara.register_driver :Selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
    config.default_max_wait_time = 10 #segundos
    config.default_driver = :Selenium
    config.javascript_driver = :chrome
end
