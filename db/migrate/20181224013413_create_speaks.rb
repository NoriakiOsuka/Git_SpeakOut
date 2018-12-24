class CreateSpeaks < ActiveRecord::Migration[5.2]
  def change
    create_table :speaks do |t|
      t.text   :text
      t.string  :field
      t.string  :subject
      t.integer :st_user_id

      t.timestamps
    end
  end
end
