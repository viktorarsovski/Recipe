require 'rails_helper'

RSpec.describe "HomePages" do
  before do
    #driven_by :selenium, using: :chrome
     driven_by :rack_test

    visit root_path
  end

  def log_in(user)
    visit login_path

    within('form') do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on 'Log In'
    end
  end

  it 'shows the home link' do
    expecting = page.has_link?('My Recipes')

    expect(expecting).to be true
  end

  context 'when no user is sign in' do
    it 'shows the Log In link' do
      expecting = page.has_link?('Log In')

      expect(expecting).to be true
    end

    it 'shows the Sign Up link' do
      expecting = page.has_link?('Sign Up')

      expect(expecting).to be true
    end
  end

  context 'when user is sign in into the app' do
    before do
      log_in(create(:user))
      visit root_path
    end

    it 'shows the New Recipe link' do
      expecting = page.has_link?('New Recipe')

      expect(expecting).to be true
    end

    it 'shows the Log Out link' do
      expecting = page.has_link?('Log Out')

      expect(expecting).to be true
    end
  end

  context 'when the recipe is present' do
    let!(:recipe) { create(:recipe, title: 'Testing with RSpec', description: 'Testing recipe body') }

    before do
      visit root_path
    end

    it 'shows the recipe title' do
      expecting = page.has_content?(recipe.title)

      expect(expecting).to be true
    end

    it 'shows the recipe body' do
      expecting = page.has_content?(recipe.description)

      expect(expecting).to be true
    end

    it 'shows the link to recipe' do
      expecting = page.has_link?('Show')

      expect(expecting).to be true
    end
  end
end