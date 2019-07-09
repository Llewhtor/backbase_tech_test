# frozen_string_literal: true

Given('the user adds a computer called {string} via UI') do |name|
binding.pry
  portal.main.add_computer.click
  comp = load_computer
  portal.detail.name.send_keys(comp[name]['name'])
  portal.detail.create.click
end

Given('the user adds a computer called {string} via API') do |name|
  create_computer(name)
  visit FigNewton.base_url
end

When('the user navigates to the main page') do
  visit FigNewton.base_url
end

Then('the computers found is updated by 1') do
end

And('the computer {string} is correctly visible in the table') do |name|
end

When('the user deletes the computer {string}') do |name|
end

Then('the computer {string} is no longer visible in the table') do |name|
end

When('the user views details for computer {string}') do |name|
end

Then('the information for computer {string} is present') do |name|
end

When('the user updates the {string} details and clicks {string}') do |name, btn|
end

Then('computer {string} is listed {int} times in the table') do |name, count|
end

When('the user sorts the column {string} by {string} order') do |col, order|
end
