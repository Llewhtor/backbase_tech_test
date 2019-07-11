# frozen_string_literal: true

Given('the user adds a new computer called {string} via UI') do |name|
  @comp_name = name
  @comp_count = portal.main.comp_count
  expect(portal.main.sub_heading).to include('computers found')
  portal.main.add_computer.click
  page_title = 'Play sample application — Computer database'
  expect(portal.main.title.text).to eq(page_title)
  expect(portal.main.sub_heading).to eq('Add a computer')
  portal.detail.enter_comp_info(name)
  portal.detail.create.click
  unless portal.detail.has_bad_input?
    page.should have_selector('#main')
    expect(portal.main.comp_count).to eq(@comp_count + 1)
  end
end

Then('the computers found is updated by 1') do
  expect(portal.main.comp_count).to eq(@comp_count + 1)
end

When('success message is displayed for {string} computer') do |name|
  comp = load_computer[name]['name']
  msg =  "Done! Computer #{comp} has been created"
  expect(portal.main.alert.text).to eq(msg)
end

And('computer {string} is visible in the table when searching') do |name|
  portal.main.search_computers(name)
  table_array = portal.main.computer_list.text.split("\n")
  comp = load_comp_table[name]
  expect(table_array).to include(comp)
end

Then('computer {string} is visible in the table when not searching') do |name|
  table_array = portal.main.computer_list.text.split("\n")
  comp = load_comp_table[name]
  expect(table_array).to include(comp)
end

Then('the computer {string} is no longer visible in the table') do |name|
  msg = 'Done! Computer has been deleted'
  expect(portal.main.alert.text).to eq(msg)
  table_array = portal.main.computer_list.text.split("\n")
  comp = load_comp_table[name]
  expect(table_array).not_to include(comp)
  expect(portal.main.comp_count).to eq(@comp_count)
end

When('the user views details for computer {string}') do |name|
  comp = load_computer[name]['name']
  portal.main.click_comp(comp)
  page.should have_selector('#main')
  expect(portal.main.sub_heading).to eq('Edit computer')
end

Then('computer {string} is listed {int} times in the table') do |_name, _count|
  table_array = portal.main.computer_list.text.split("\n")
  counts = Hash.new(0)
  table_array.each { |comp| counts[comp] += 1 }
end

When('the user searches for computer {string}') do |name|
  @comp_name = name
  portal.main.search_computers(name)
end

When('the user sorts the column {string} by {string} order') do |col, order|
  case order
  when 'descending'
    portal.main.sort(col)
  when 'ascending'
    portal.main.sort(col)
    portal.main.sort(col)
  end
end

Then('{string} message is displayed') do |msg|
  expect(portal.main.not_found.text).to eq(msg)
end

Given('pagination displays results numbers') do
  pagination = portal.main.pagination
  @original_from = pagination[1].to_i
  @original_to = pagination[3].to_i
  @original_of = pagination[5].to_i
end

When('the user clicks {string} page') do |button|
  @comp_name = 'standard'
  case button
  when 'next'
    portal.main.next.click
  when 'previous'
    portal.main.next.click
    portal.main.previous.click
  end
end

Then('the pagination updates correctly for {string} page') do |button|
  pagination = portal.main.pagination
  from = pagination[1].to_i
  to = pagination[3].to_i
  of = pagination[5].to_i
  if button == 'next'
    expect(from).to eq(@original_from + 10)
    expect(to).to eq(@original_to + 10)
    expect(of).to eq(@original_of)
  elsif button == 'previous'
    expect(from).to eq(@original_from)
    expect(to).to eq(@original_to)
    expect(of).to eq(@original_of)
  end
end
