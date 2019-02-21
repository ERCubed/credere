class UpdateCredereTables < ActiveRecord::Migration[5.2]
  def change
    # we have to remove these indexes because the temporary
    # table index name is too long
    remove_index :credere_amounts, [:account_id, :transaction_id]
    remove_index :credere_amounts, [:transaction_id, :account_id]
    remove_index :credere_transactions, column: [:commercial_document_id, :commercial_document_type], :name => "index_transactions_on_commercial_doc"

    rename_table :credere_transactions, :credere_entries
    rename_column :credere_amounts, :transaction_id, :entry_id

    # adding the indexes back
    add_index :credere_amounts, [:account_id, :entry_id]
    add_index :credere_amounts, [:entry_id, :account_id]
    add_index :credere_entries, [:commercial_document_id, :commercial_document_type], :name => "index_entries_on_commercial_doc"
  end
end
