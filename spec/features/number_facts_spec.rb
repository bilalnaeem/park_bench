require 'rails_helper'

describe 'the number searching  process', :type => :feature do
  before :each do
    Rails.cache.clear
    user = create(:user, email: 'testuser@gmail.com')
    login_as(user, :scope => :user)
  end

  it 'visit home page and enter number to be searched', :js => true do
    facts = ['fact 1', 'fact 2', 'fact 3', 'fact 4', 'fact 5', 'fact 6', 'fact 7', 'fact 8', 'fact 9']
    allow(NumberAPI).to receive(:get_number_facts).and_return(facts)
    visit root_path
    fill_in 'number', :with => 10
    click_button 'Get random facts'
    wait_for_ajax
    ['Fact 1', 'Fact 2', 'Fact 3', 'Fact 4', 'Fact 5'].each do |f|
      expect(page).to have_content f
    end
    click_link '2'
    wait_for_ajax
    ['Fact 6', 'Fact 7', 'Fact 8', 'Fact 9'].each do |f|
      expect(page).to have_content f
    end
  end

  it 'show message if no fact found for given number', :js => true do
    visit root_path
    allow(NumberAPI).to receive(:get_number_facts).and_return([])
    fill_in 'number', :with => 999
    click_button 'Get random facts'
    wait_for_ajax
    expect(page).to have_content 'No facts found please try again some other number.'
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      active = page.evaluate_script('jQuery.active')
      until active == 0
        active = page.evaluate_script('jQuery.active')
      end
    end
  end

end