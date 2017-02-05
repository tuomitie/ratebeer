class AddUserIdToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :user_id, :integer
  end
end
