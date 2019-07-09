# frozen_string_literal: true

# Main test page for backbase
class Main < SitePrism::Page
  element :main, '#main'
  element :home, 'a', text: 'Play sample application — Computer database'
  element :search_input, '#searchbox'
  element :filter_by_name, '#searchsubmit'
  element :add_computer, '#add'
  element :computer_list, 'table.computers.zebra-striped'
  element :previous, 'li.prev'
  element :current, 'li.current'
  element :next, 'li.next'
  element :alert, 'div.alert-message.warning'

  def comp_count
    within main do
      comps = find('h1')
      text = comps.text
      number = text.scan(/\d+/).first
      number.to_i
    end
  end
end
