class AddDateToCredereEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :credere_entries, :date, :date
    add_index :credere_entries, :date
  end
end
