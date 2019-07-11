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
  element :bad_input, 'div.clearfix.error'

  def select_company(comp)
    company.click
    within company do
      @select = find('option', text: comp)
    end
    @select.click
  end

  def clear_fields
    name.native.clear
    intro_date.native.clear
    discontinued.native.clear
  end

  def enter_name(comp)
    name.send_keys(load_computer[comp]['name'])
  end

  def enter_introduced(comp)
    intro_date.send_keys(load_computer[comp]['introduced'])
  end

  def enter_discontinued(comp)
    discontinued.send_keys(load_computer[comp]['discontinued'])
  end

  def enter_comp_info(comp)
    enter_name(comp)
    enter_introduced(comp)
    enter_discontinued(comp)
    select_company(load_computer[comp]['company'])
  end
end
