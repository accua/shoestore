require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The add shoe store path', type: :feature) do
  it('Takes the user input and creates a shoe store object') do
    visit('/')
    fill_in('store_name', with: 'foot locker')
    click_on('Add Store')
    expect(page).to have_content 'Foot Locker'
  end
end

describe('The add shoe brand path', type: :feature) do
  it('Takes the user input and creates a shoe brand object') do
    visit('/')
    fill_in('brand_name', with: 'Merrell')
    click_on('Add Brand')
    expect(page).to have_content 'Merrell'
  end
end

describe('The edit shoe store path', type: :feature) do
  it('Takes the user to the store edit form') do
    visit('/')
    fill_in('store_name', with: 'foot locker')
    click_on('Add Store')
    click_on('mode_edit')
    expect(page).to have_content 'Update Store'
  end
end
