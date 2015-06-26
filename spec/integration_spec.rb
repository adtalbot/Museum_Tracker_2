require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the museum tracker website path', {:type => :feature}) do
  it('stores a list of museums and artwork') do
    visit('/')
    expect(page).to(have_content('Click to see all Museums'))
    expect(page).to(have_content('Click to see all Artwork'))
  end
end

