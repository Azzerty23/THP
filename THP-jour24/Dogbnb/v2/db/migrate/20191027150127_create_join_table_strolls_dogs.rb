class CreateJoinTableStrollsDogs < ActiveRecord::Migration[5.2]
  def change
    create_join_table :strolls, :dogs do |t|
      t.index [:stroll_id, :dog_id]
      t.index [:dog_id, :stroll_id]
    end
  end
end
