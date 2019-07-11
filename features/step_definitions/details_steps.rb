# frozen_string_literal: true

When('the user deletes the computer {string}') do |name|
  comp = load_computer[name]['name']
  portal.main.click_comp(comp)
  portal.detail.delete.click
end

Then('the information for computer {string} is present') do |name|
  comp = load_computer[name]
  expect(find_field('Computer name').value).to eq(comp['name'])
  expect(find_field('Introduced date').value).to eq(comp['introduced'])
  expect(find_field('Discontinued date').value).to eq(comp['discontinued'])
  expect(find_field('Company').value).to eq(comp['comp_value'])
end

When('the user updates the {string} details and clicks {string}') do |name, btn|
  @comp_name = name
  portal.detail.clear_fields
  portal.detail.enter_comp_info(name)
  case btn
  when 'submit'
    portal.detail.create.click
  when 'save'
    portal.detail.create.click
  when 'cancel'
    portal.detail.cancel.click
  end
end

Then('the bad input generates an error') do
  expect portal.detail.bad_input.visible?
end
