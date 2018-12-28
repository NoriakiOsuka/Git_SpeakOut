class CreateCrossfollows < ActiveRecord::Migration[5.2]
  def change
    create_table :crossfollows do |t|
      t.integer :followable_id
      t.string  :followable_type
      t.integer :st_user_id
      t.integer :ad_user_id

      t.timestamps
    end
    
    add_index :crossfollows, :followable_id
    add_index :crossfollows, :st_user_id
    add_index :crossfollows, :ad_user_id
    add_index :crossfollows, [:followable_id, :st_user_id], unique: true
    add_index :crossfollows, [:followable_id, :ad_user_id], unique: true
  end
end
