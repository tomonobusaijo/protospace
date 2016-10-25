require 'rails_helper'

describe Capturedimage do
  describe "#create" do
    it "has the wrong content format" do
      capturedimage = build(:main_image, picture: fixture_file_upload("img/sample.rtf", 'image/rtf'))
      capturedimage.valid?
      expect(capturedimage.errors[:picture][0]).to include("You are not allowed to upload \"rtf\" files, allowed types: jpg, jpeg, gif, png")
    end

    describe "with valid attributes" do
      it "has a valid factory" do
        prototype = build(:prototype)
        capturedimage = build(:main_image, prototype: prototype)
        expect(capturedimage).to be_valid
      end
    end

    describe "without content attribute" do
      it "returns error" do
        prototype = build(:prototype)   # 親ファクトリを先に作成
        capturedimage = build(:main_image, prototype: prototype)
        expect{ capturedimage.picture nil }.to raise_error(ArgumentError)
      end
    end

    describe "without status attribute" do
      it "returns error" do
        prototype = build(:prototype)
        capturedimage = build(:capturedimage, :main, prototype: prototype)   # 呼び出し方は:main_imageのみでもどちらでも良い
        expect{ capturedimage.role nil }.to raise_error(ArgumentError)
      end
    end
  end
end
