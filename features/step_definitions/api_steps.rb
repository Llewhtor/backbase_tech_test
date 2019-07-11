# frozen_string_literal: true

Given('a computer called {string} is added via API') do |name|
  @comp_name = name
  @comp_count = portal.main.comp_count
  create_computer(name)
  visit FigNewton.base_url
end

Given('invalid post request {string} is made to the add endpoint') do |name|
  create_computer(name)
end

Then('a {string} response code is recieved') do |code|
  expect(@request.code).to eq(code)
end

Given('invalid post request is made to the delete endpoint') do
  post_invalid_delete_request
end
