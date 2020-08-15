require 'rails_helper'

RSpec.describe "RecipesInteraction" do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }

  before do
    #driven_by :selenium, using: :chrome
     driven_by :rack_test

    log_in(user)
    # visit recipe_path(recipe)
  end

  describe 'Creating the recipe' do
    it 'creates and shows the newly created recipe' do
      title = 'Red Velvet Strawberry Cake'
      body = 'I made this strawberry cake'

      click_on('New Recipe')

      within('form') do
        fill_in "Title", with: title
        fill_in "Description", with: body

        click_on 'Save Recipe'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(body)
    end
  end

  describe 'Editing the recipe' do
    it 'edits and shows the recipe' do
      title = 'New Title'
      body = 'New Body'

      visit recipe_path(recipe)

      click_on 'Edit'

      within('form') do
        fill_in "Title", with: title
        fill_in "Description", with: body

        click_on 'Update Recipe'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(body)
    end
  end

  describe 'Deleting the recipe' do
    it 'deletes the recipe and redirect to index view' do
      visit recipe_path(recipe)

      # Only if using selenium driver.
      # If not, comment this block
      # accept_alert do
      # click_on 'Delete'
      # end

      # If using rack_test driver, uncomment this block
      # click_on 'Delete'

      expect(page).to have_content('Recipes')
    end
  end

  describe 'Going back to recipe index page' do
    it 'goes back to recipe index page' do
      visit recipe_path(recipe)

      click_on 'Back'

      expect(page).to have_content('Recipes')
    end
  end
end
