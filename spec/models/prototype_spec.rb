require 'rails_helper'

describe Prototype do
  describe "associations" do
    describe "with likes" do
      it "deletes the likes when prototype is deleted" do
        prototype = create(:prototype, :with_likes)
        expect{ prototype.destroy }.to change{ prototype.likes.count }.from(prototype.likes.count).to(0)
      end
    end

    describe "with comments" do
      it "deletes the comments when prototype is deleted" do
        prototype = create(:prototype, :with_comments)
        expect{ prototype.destroy }.to change{ prototype.comments.count }.from(prototype.comments.count).to(0)
      end
    end
  end

  describe "validations" do
    describe "with valid attributes" do
      it "has a valid factory" do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    describe "without valid attributes" do
      it "is missing a title" do
        prototype = build(:prototype, title:"")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it "is missing a catch_copy" do
        prototype = build(:prototype, catchcopy:"")
        prototype.valid?
        expect(prototype.errors[:catchcopy]).to include("can't be blank")
      end

      it "is missing a concept" do
        prototype = build(:prototype, concept:"")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe "#posted_date" do
    it "returns dates in a specified format" do
      prototype = build(:prototype, created_at: "2016-10-25 00:00:00 UTC")
      expect(prototype.posted_date(prototype.created_at)).to eq "2016/10/25"
    end
  end

  describe "#like_user(user)" do
    context "when liked by a user" do
      it "returns true" do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, user: user, prototype: prototype)   # createしないとlike_userのfind_byに引っかからない
        expect(prototype.like_user(user)).to be_truthy
      end
    end

    context "when not liked by a user" do
      it "returns nil" do
        user = create(:user)
        another_user = create(:user)
        prototype = create(:prototype, user: another_user)
        like = create(:like, user: another_user, prototype: prototype)
        expect(prototype.like_user(user)).to eq nil
      end
    end
  end

  describe "#set_sub_thumbnails" do
    it "returns an array containing sub_images" do
      prototype = create(:prototype, :with_sub_images)
      expect(prototype.capturedimages).to be_truthy
    end
  end

  describe "#reject_sub_images(attributed)" do
    it "doesn't save a record with nil content" do
      captured_subimage = build(:sub_image, picture: nil)
      captured_subimage.valid?
      expect(captured_subimage.errors[:picture]).to include("can't be blank")
    end
  end

end
