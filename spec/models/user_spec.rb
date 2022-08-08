require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'presence' do
      it { should validate_presence_of :email }
      it { should validate_presence_of :password }
      it { should validate_presence_of(:password_confirmation).on :create }
      it { should validate_presence_of :api_key }
    end

    describe 'uniqueness' do
      it { should validate_uniqueness_of :email }
    end
  end
end
