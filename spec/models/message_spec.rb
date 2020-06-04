require 'rails_helper'

describe Message   do
  describe '#create' do

      it 'messageがあればメッセージを送信できること' do
        message = build(:message)
        expect(build(:message)).to be_valid
      end

      it 'messageがなければメッセージを送信できないこと' do
        message = build(:message, message: nil)
        message.valid?
        expect(message.errors[:message]).to include("を入力してください")
      end

      it ' user_idが無いと保存できないこと' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end

      it 'room_idが無いと保存できないこと' do
        message = build(:message, room_id: nil)
        message.valid?
        expect(message.errors[:room]).to include("を入力してください")
      end
    end
  end
