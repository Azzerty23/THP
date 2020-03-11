class CreateStrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :strolls do |t|
      t.references :dogsitter
      t.references :city

      t.timestamps
    end
  end
end
