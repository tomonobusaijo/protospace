require 'rails_helper'

describe User do
  describe "#create" do
    let(:user) { build(:user) }
    describe "with valid attributes" do
      it "is valid with all informantion" do
        expect(user).to be_valid
      end
    end

    describe "without valid attributes" do
      it "is invalid without a name" do
        user.name = nil
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "is invalid without an email" do
        user.email = nil
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without a password" do
        user.password = nil
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid without a password_confirmation although with a password" do
        user.password_confirmation = ""
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid with a duplicate email address" do
        user.save
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "is invalid without a password that has less 7 characters" do
        user.password = user.password_confirmation = "0000000"
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end
  end
end
