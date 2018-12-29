class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :st_user_id
      t.integer :ad_user_id
      t.integer :speak_id

      t.timestamps
      
      t.index :st_user_id
      t.index :ad_user_id
      t.index :speak_id
      t.index [:st_user_id, :speak_id], unique: true
      t.index [:ad_user_id, :speak_id], unique: true
    end
  end
end
