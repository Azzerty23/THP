class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
