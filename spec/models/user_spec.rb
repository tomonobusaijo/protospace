require 'rails_helper'

describe User do
  describe '#create' do
    describe 'with valid attributes' do
      it 'is valid with all informantion' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    describe 'without valid attributes' do
      it 'is invalid without a name' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without an email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid without a password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid without a password_confirmation although with a password' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'is invalid with a duplicate email address' do
        user = create(:user)
        another_user = create(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it 'is invalid without a password that has less 7 characters' do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end
  end
end
