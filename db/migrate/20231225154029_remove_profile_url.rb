class RemoveProfileUrl < ActiveRecord::Migration[6.1]
  def change
    remove_column :vr_people, :profile_url, :text
  end
end
