# frozen_string_literal: true

Before('@ui') do
  visit FigNewton.base_url
  page.should have_selector('#main')
end

After('@ui') do
  cleanup unless @comp_name == 'no_name'
  Capybara.current_session.driver.quit
end
