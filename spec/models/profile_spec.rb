require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'バリデーションのテスト' do
    context 'プロフィール欄が空の場合' do
      it 'バリデーションにひっかる' do
        profile = Profile.new(description: '') # 変数名を message に修正
        expect(profile).not_to be_valid
      end
    end

    context 'プロフィール欄に内容が記載されている場合' do
      it 'バリデーションに通る' do
        profile = Profile.new(description: 'test') # 変数名を message に修正
        expect(profile).not_to be_valid
      end
    end
  end
end

