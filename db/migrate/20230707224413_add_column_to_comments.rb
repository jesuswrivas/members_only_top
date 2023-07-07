class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :guest_name, :string

  end
end
