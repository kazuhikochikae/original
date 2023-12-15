class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string # ユーザー名
    add_column :users, :description, :text # プロフィール
  end
end
