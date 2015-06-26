require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the museum tracker website path', {:type => :feature}) do
  it('displays links to lists of museums and artwork') do
    visit('/')
    expect(page).to(have_content('Click to see all Museums'))
    expect(page).to(have_content('Click to see all Artwork'))
  end
  it('shows a list of all museums and allows you to add a museum and artwork') do
    visit('/museums')
    fill_in('name', {:with => 'Portland Museum'})
    click_button('Add')
    expect(page).to(have_content('Portland Museum'))
    click_link('Portland Museum')
    fill_in('name', {:with => 'Painting'})
    click_button('Add')
    expect(page).to(have_content('Painting'))
  end   
end

