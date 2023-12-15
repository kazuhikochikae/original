class AddProfileToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :name, :string 
    add_column :characters, :description, :text
    add_column :characters, :message, :string

  end
end
