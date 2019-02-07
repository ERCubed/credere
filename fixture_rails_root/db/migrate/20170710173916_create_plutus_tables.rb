class CreatePlutusTables < ActiveRecord::Migration\[5\.2\]
  def self.up
    create_table :credere_accounts do |t|
      t.string :name
      t.string :type
      t.boolean :contra

      t.timestamps
    end
    add_index :credere_accounts, [:name, :type]

    create_table :credere_entries do |t|
      t.string :description
      t.date :date
      t.integer :commercial_document_id
      t.string :commercial_document_type

      t.timestamps
    end
    add_index :credere_entries, :date
    add_index :credere_entries, [:commercial_document_id, :commercial_document_type], :name => "index_entries_on_commercial_doc"

    create_table :credere_amounts do |t|
      t.string :type
      t.references :account
      t.references :entry
      t.decimal :amount, :precision => 20, :scale => 10
    end
    add_index :credere_amounts, :type
    add_index :credere_amounts, [:account_id, :entry_id]
    add_index :credere_amounts, [:entry_id, :account_id]
  end

  def self.down
    drop_table :credere_accounts
    drop_table :credere_entries
    drop_table :credere_amounts
  end
end
