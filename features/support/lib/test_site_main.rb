# frozen_string_literal: true

# Main test page for backbase
class Main < SitePrism::Page
  element :main, '#main'
  element :title, 'header.topbar'
  element :home, 'a', text: 'Play sample application — Computer database'
  element :search_input, '#searchbox'
  element :filter_by_name, '#searchsubmit'
  element :add_computer, '#add'
  element :computer_list, 'table.computers.zebra-striped'
  element :previous, 'a', text: 'Previous'
  element :current, 'li.current'
  element :next, 'a', text: 'Next'
  element :alert, 'div.alert-message.warning'
  element :computer_name, 'th.col2'
  element :introduced, 'th.col3'
  element :discontinued, 'th.col4'
  element :company, 'th.col5'
  element :not_found, 'div.well'

  def sub_heading
    within main do
      find('h1').text
    end
  end

  def comp_count
    number = sub_heading.scan(/\d+/).first
    number.to_i
  end

  def click_comp(name)
    within computer_list do
      @selection = find('a', text: name, match: :first)
    end
    @selection.click
  end

  def search_computers(name)
    search_input.native.clear
    comp = load_computer[name]['name']
    if comp == 'symbols_name'
      trimmed = comp.tr('\\')
      search_input.send_keys(trimmed)
    else
      search_input.send_keys(comp)
    end
    filter_by_name.click
  end

  def sort(column)
    case column
    when 'computer_name'
      computer_name.click
    when 'introduced'
      introduced.click
    when 'discontinued'
      discontinued.click
    when 'company'
      company.click
    end
  end

  def pagination
    current.text.split(' ')
  end
end
