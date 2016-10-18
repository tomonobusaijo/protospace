require 'rails_helper'

describe User do
  describe '#create' do
    describe 'with valid attributes' do
      it 'is valid with all informantion' do
      end
    end

    describe 'without valid attributes' do
      it 'is invalid without a name' do
      end

      it 'is invalid without an email' do
      end

      it 'is invalid without a password' do
      end

      it 'is invalid without a password_confirmation although with a password' do
      end

      it 'is invalid with a duplicate email address' do
      end

      it 'is invalid without a password that has less 7 characters' do
      end
    end
  end
end
