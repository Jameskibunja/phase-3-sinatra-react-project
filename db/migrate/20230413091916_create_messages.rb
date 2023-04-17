class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.string :username
      t.text :content
      t.timestamps
    end
  end
end
