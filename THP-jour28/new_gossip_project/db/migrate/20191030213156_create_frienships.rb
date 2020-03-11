class CreateFrienships < ActiveRecord::Migration[5.2]
  def change
    create_table :frienships do |t|
      t.references :asker, foreign_key: {to_table: :users}
      t.references :responder, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
