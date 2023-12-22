require 'rails_helper'

RSpec.describe 'システムテスト', type: :system do


 

  describe 'ユーザーのテスト' do
    it '他のユーザーのプロフィール編集ページへのアクセスが拒否されること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: '新規ユーザ'
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント登録'
      expect(page).to have_content 'アカウント登録が完了しました。'
  
      visit edit_profile_path # 他のユーザーのプロフィール編集ページへのリンク

      expect(page).to have_content('他のユーザーのプロフィールを編集する権限がありません。')
    end
  end


end

