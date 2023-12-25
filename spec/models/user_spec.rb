require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '', email: 'test@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'ユーザーのメールアドレスが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '山田', email: '', password: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'ユーザーのパスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '山田', email: 'test@example.com', password: '')
        expect(user).not_to be_valid
      end
    end

    context 'ユーザーの名前とメールアドレスとパスワードに内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = User.new(name: '山田', email: 'test@example.com', password: 'password')
        expect(user).to be_valid
      end
    end

  end


end