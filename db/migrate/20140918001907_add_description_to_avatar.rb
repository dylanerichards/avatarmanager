class AddDescriptionToAvatar < ActiveRecord::Migration
  def change
    add_column :avatars, :description, :text
  end
end
