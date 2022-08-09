require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'presence' do
      it { should validate_presence_of :email }
      it { should validate_presence_of :password_digest }
      # it { should validate_presence_of :password }
      # it { should validate_presence_of(:password_confirmation).on :create }
      # it { should validate_presence_of :api_key }
    end

    describe 'uniqueness' do
      it { should validate_uniqueness_of :email }
      it { should validate_uniqueness_of :api_key }
    end
  end

  describe 'model methods' do
    it 'can generate an api key' do
      @user = User.create!(email: 'bob@gmail.com', password: '12345', password_confirmation: '12345')
      expect(@user.api_key).to eq(nil)
      @user.gen_api_key
      expect(@user.api_key.length).to eq(22)
    end
  end
end
