class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :appointments, :doctor
    add_foreign_key :appointments, :patient
    add_foreign_key :appointments, :city
  end
end
