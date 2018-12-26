class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text     :text
      t.integer  :log_grade
      t.integer  :exp_grade
      t.integer  :cre_grade
      t.integer  :ad_user_id
      t.integer  :st_user_id
      t.integer  :speak_id

      t.timestamps
    end
  end
end
