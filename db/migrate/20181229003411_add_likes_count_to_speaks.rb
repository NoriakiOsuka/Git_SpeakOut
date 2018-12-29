class AddLikesCountToSpeaks < ActiveRecord::Migration[5.2]
  def change
    add_column :speaks, :likes_count, :integer
  end
end
