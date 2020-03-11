class RenameAppointementsToAppointments < ActiveRecord::Migration[5.2]
  def change
    rename_table :appointements, :appointments
  end
end
