# frozen_string_literal: true

# Main test page for backbase
class Main < SitePrism::Page
  element :home, 'a', text: 'Play sample application — Computer database '
  element :search_input, '#searchbox'
  element :filter_by_name, '#searchsubmit'
  element :add_computer, '#add'
  element :computer_list, 'table.computers.zebra-striped'
  element :previous, 'li.prev'
  element :current, 'li.current'
  element :next, 'li.next'
end
