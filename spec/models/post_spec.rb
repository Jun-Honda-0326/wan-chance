require 'rails_helper'

describe Post, type: :model  do
  describe '#create' do

      it 'text と imageがあれば投稿を保存できること' do
        expect(build(:post)).to be_valid
      end

      it 'textがなければ保存できないこと' do
        post = build(:post, text: nil)
        post.valid?
        expect(post.errors[:text]).to include("を入力してください")
      end

      it 'imageがなければ保存できないこと' do
        post = build(:post, image: nil)
        post.valid?
        expect(post.errors[:image]).to include("を入力してください")
      end

      it ' user_idが無いと保存できないこと' do
        post = build(:post, user_id: nil)
        post.valid?
        expect(post.errors[:user]).to include("を入力してください")
      end
    end
  end