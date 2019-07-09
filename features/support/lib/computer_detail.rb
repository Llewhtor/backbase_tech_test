# frozen_string_literal: true

# Computer detail test page for backbase
class Detail < SitePrism::Page
  element :name, '#name'
  element :intro_date, '#introduced'
  element :discontinued, '#discontinued'
  element :company, '#company'
  element :create, 'input.btn.primary'
  element :cancel, 'a.btn'
  element :delete, 'input.btn.danger'

  def select_company(comp)
    company.click
    within company do
      @select = find('option', text: comp)
    end
    @select.click
  end
end
