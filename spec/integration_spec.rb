require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the museum tracker website path', {:type => :feature}) do
  it('stores a list of museums and artwork') do
    visit('/')
    expect(page).to(have_content('Click to see all museums'))
    expect(page).to(have_content('Click to see all artwork'))
  end
end

