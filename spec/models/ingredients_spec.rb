require 'rails_helper'

RSpec.describe Ingredient do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
  end
end