# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'capybara-selenium'
require 'cucumber'
require 'fig_newton'
require 'require_all'
require 'rspec'
require 'rubocop'
require 'site_prism'
require 'watir'
require 'webdrivers'

require_all '/config'

World(Capybara::DSL)
