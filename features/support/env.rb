# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'fig_newton'
require 'pry'
require 'require_all'
require 'rspec'
require 'rubocop'
require 'selenium-webdriver'
require 'site_prism'
require 'watir'
require 'webdrivers'

def portal
  Portal.new
end

World(Capybara::DSL)
