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

describe('The update shoe store path', type: :feature) do
  it('Takes the user input and renames the store') do
    visit('/')
    fill_in('store_name', with: 'foot locker')
    click_on('Add Store')
    click_on('mode_edit')
    fill_in('store_update', with: "Journey's")
    click_on('Update Store')
    visit('/')
    expect(page).to have_content "Journey's"
  end
end

describe('The delete shoe store path', type: :feature) do
  it('Deletes the selected shoe store') do
    visit('/')
    fill_in('store_name', with: 'foot locker')
    click_on('Add Store')
    click_on('mode_edit')
    click_on('Delete Store')
    visit('/')
    expect(page).to have_content "There aren't any stores to display, why don't you add one?"
  end
end

describe('The add shoe brand object to shoe store object path', type: :feature) do
  it('Adds a shoe brand object that already exists to the specified shoe store.') do
    visit('/')
    fill_in('store_name', with: 'foot locker')
    click_on('Add Store')
    fill_in('brand_name', with: 'danner')
    click_on('Add Brand')
    fill_in('brand_name', with: 'nike')
    click_on('Add Brand')
    click_on('Foot Locker')
    select('Danner')
    click_on('Choose Brand')
    select('Nike')
    click_on('Choose Brand')
    expect(page).to have_content "Danner Nike"
  end
end
