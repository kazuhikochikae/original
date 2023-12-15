class CreateVrPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :vr_people do |t|
      t.string :name
      t.text :description
      t.text :profile_url
      t.string :message
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
