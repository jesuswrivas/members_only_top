class RemoveUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :user_id
    



  end
end
