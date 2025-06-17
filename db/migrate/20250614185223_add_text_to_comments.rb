class AddTextToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :text, :text
  end
end
