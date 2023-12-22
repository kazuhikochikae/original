require 'rails_helper'

RSpec.describe 'システムテスト', type: :system do
  describe 'ユーザ登録のテスト' do
    it 'ユーザの新規登録ができること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: '新規ユーザ'
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント登録'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end

  describe 'ユーザーのテスト' do
    it 'ユーザの新規登録ができること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: '新規ユーザ'
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント登録'
    end
    it 'ログインができること' do
      
      visit new_user_session_path
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      click_on 'commit'
    end
  end


 describe 'ユーザーのテスト' do
    it 'ユーザの編集ができること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: '新規ユーザ'
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント登録'
      expect(page).to have_content 'アカウント登録が完了しました。'
      
      visit edit_user_registration_path
      fill_in 'user[name]', with: 'testttt'
      click_on 'commit'
    end
  end



  describe 'ユーザーのテスト' do
    it '他のユーザーのプロフィール編集ページへのアクセスが拒否されること' do
      # 新しいユーザーを登録
      visit new_user_registration_path
      fill_in 'user[name]', with: '新規ユーザ'
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント登録'
      visit new_profile_path
      fill_in 'profile[description]', with: 'はじめまして！'
      click_on 'commit'
      
      click_on 'ログアウト'

      # 別の新しいユーザーを登録
      visit new_user_registration_path
      fill_in 'user[name]', with: '新規ユーザ02'
      fill_in 'user[email]', with: 'test666@co.jp'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント登録'

      visit new_profile_path
      fill_in 'profile[description]', with: 'はじめまして！'
      click_on 'commit'
      click_on 'ログアウト'

      # 最初のユーザーでログイン
      visit new_user_session_path
      fill_in 'user[email]', with: 'test333@co.jp'
      fill_in 'user[password]', with: '123456'
      click_on 'commit'

      # 別のユーザーのプロフィール編集ページへのリンクをクリック
      visit edit_profile_path(User.last.profile.id)  

      expect(page).to have_content('他のユーザーのプロフィールを編集する権限がありません。')
    end
  end


end
