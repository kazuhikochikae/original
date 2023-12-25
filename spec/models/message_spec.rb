require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'バリデーションのテスト' do
    context 'メッセージが空の場合' do
      it 'バリデーションにひっかる' do
        message = Message.new(body: '') # 変数名を message に修正
        expect(message).not_to be_valid
      end
    end

    context 'メッセージに記載がある場合' do
      it 'バリデーションに通る' do
        message = Message.new(body: 'testtest') 
        expect(message).not_to be_valid
      end
    end
  end


end