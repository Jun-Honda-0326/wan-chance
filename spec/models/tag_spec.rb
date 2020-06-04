require 'rails_helper'

describe Tag  do
  describe '#create' do

    it "tagnameがあれば登録できること" do
      tag = build(:tag)
      expect(tag).to be_valid
    end

    it "tagnameがなければ登録できないこと" do
      tag = build(:tag, tagname: nil)
      tag.valid?
      expect(tag.errors[:tagname]).to include("を入力してください")
    end

  end
end