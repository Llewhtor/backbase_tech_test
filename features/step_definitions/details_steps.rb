When('the user deletes the computer {string}') do |name|
  comp = load_computer[name]['name']
  portal.main.click_comp(comp)
  portal.detail.delete.click
end