# frozen_string_literal: true

# Computer detail test page for backbase
class Main < SitePrism::Page
  element :name, '#name'
  element :intro_date, '#introduced'
  element :discontinued, '#discontinued'
  element :company, '#company'
  element :create, 'button', value: 'Create this computer'
  element :cancel, 'a', text: 'Cancel'
  element :delete, 'button', value: 'Delete this computer'
end
