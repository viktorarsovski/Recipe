require 'rails_helper'

RSpec.describe User do
  context 'before saving' do
    it 'transforms email to lower case' do
      viktor = create(:user, email: 'TESTER@TEST.COM')

      expect(viktor.email).to eq 'tester@test.com'
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to have_secure_password }

    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_length_of(:username).is_at_most(50) }

    it { is_expected.to validate_length_of(:email).is_at_most(50) }

    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  context 'email must be unique' do
    subject { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context 'when entering invalid email format' do
    it 'is invalid' do
      viktor = build(:user, email: 'viktorinvalid')

      expect(viktor.valid?).to be false
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:recipes) }
  end

  describe 'dependency' do
    let(:count) { 1 }
    let(:user) { create(:user) }

    it 'deletes recepies when user is deleted' do
      create_list(:recipe, count, user: user)

      expect { user.destroy }.to change { Recipe.count }.by(-count)
    end
  end
end