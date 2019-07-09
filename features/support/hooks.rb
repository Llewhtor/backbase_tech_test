# frozen_string_literal: true

Before do
  visit FigNewton.base_url
  page.should have_selector('#main')
end

After do
  cleanup
end
