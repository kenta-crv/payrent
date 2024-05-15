class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :estimate, foreign_key: true
      t.string :status
      t.string :next
      t.string :body
      t.timestamps
    end
  end
end
