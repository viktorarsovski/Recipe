require 'rails_helper'

RSpec.describe Recipe do
  describe 'associations and dependencies' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:ingredients).dependent(:destroy) }
    it { is_expected.to have_many(:directions).dependent(:destroy) }
  end

  describe 'accepts nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:ingredients) }
    it { is_expected.to accept_nested_attributes_for(:directions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
