require 'rails_helper'

describe Prototype do
  describe 'associations' do
    describe 'with comments' do
      it "deletes the comments when prototype is deleted" do
      end
    end

    describe 'with likes' do
      it "deletes the likes when prototype is deleted" do
      end
    end
  end

  describe 'validations' do
    describe 'with valid attributes' do
      it "has a valid factory" do
      end
    end

    describe 'without valid attributes' do
      it "is missing a title" do
      end

      it "is missing a catch_copy" do
      end

      it "is missing a concept" do
      end
    end
  end

  describe '#posted_date' do
    it 'returns dates in a specified format' do
    end
  end

  describe '#liked_by?(user)' do
    describe 'when liked by a user' do
      it 'returns true' do
      end
    end

    describe 'when not liked by a user' do
      it 'returns false' do
      end
    end
  end

  describe '#set_sub_thumbnails' do
    it 'returns an array containing sub_images' do
    end
  end

  describe '#reject_sub_images(attributed)' do
    it 'doesn\'t save a record with nil content' do
    end
  end

end
