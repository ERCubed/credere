class IdToUuidCredereTables < ActiveRecord::Migration[5.2]
  def up
    # Migrate all integer IDs to UUID in all Credere tables.
    add_column :credere_accounts, :uuid, :uuid, default: -> { "uuid_generate_v4()" }, null: false

    change_table :credere_accounts do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    if column_exists? :credere_accounts, :tenant_id
      add_column :credere_accounts, :tenant_uuid, :uuid, default: -> { "uuid_generate_v4()" }, null: false

      change_table :credere_accounts do |t|
        t.remove :tenant_id
        t.rename :tenant_uuid, :tenant_id
      end

      add_index :credere_accounts, :tenant_id
    end

    execute "ALTER TABLE credere_accounts ADD PRIMARY KEY (id);"

    add_column :credere_amounts, :uuid, :uuid, default: -> { "uuid_generate_v4()" }, null: false
    add_column :credere_amounts, :account_uuid, :uuid, default: -> { "uuid_generate_v4()" }, null: false
    add_column :credere_amounts, :entry_uuid, :uuid, default: -> { "uuid_generate_v4()" }, null: false

    change_table :credere_amounts do |t|
      t.remove :id
      t.rename :uuid, :id
      t.remove :account_id
      t.rename :account_uuid, :account_id
      t.remove :entry_id
      t.rename :entry_uuid, :entry_id
    end

    add_index :credere_amounts, :account_id
    add_index :credere_amounts, :entry_id

    execute "ALTER TABLE credere_amounts ADD PRIMARY KEY (id);"

    add_column :credere_entries, :uuid, :uuid, default: -> { "uuid_generate_v4()" }, null: false

    change_table :credere_entries do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE credere_entries ADD PRIMARY KEY (id);"
  end

  def down
    # Migrate all UUID IDs to integers in all Credere tables. Why would you want to?
    add_column :credere_accounts, :temp_id, :integer, null: false

    change_table :credere_accounts do |t|
      t.remove :id
      t.rename :temp_id, :id
    end

    if column_exists? :credere_accounts, :tenant_id
      add_column :credere_accounts, :temp_tenant_id, :integer

      change_table :credere_accounts do |t|
        t.remove :tenant_id
        t.rename :temp_tenant_id, :tenant_id
      end

      add_index :credere_accounts, :tenant_id
    end

    execute "ALTER TABLE credere_accounts ADD PRIMARY KEY (id);"

    add_column :credere_amounts, :temp_id, :integer, null: false
    add_column :credere_amounts, :temp_account_id, :integer, null: false
    add_column :credere_amounts, :temp_entry_id, :integer, null: false

    change_table :credere_amounts do |t|
      t.remove :id
      t.rename :temp_id, :id
      t.remove :temp_account_id
      t.rename :temp_account_uuid, :account_id
      t.remove :temp_entry_id
      t.rename :temp_entry_uuid, :entry_id
    end

    add_index :credere_amounts, :account_id
    add_index :credere_amounts, :entry_id

    execute "ALTER TABLE credere_amounts ADD PRIMARY KEY (id);"

    add_column :credere_entries, :temp_id, :integer, null: false

    change_table :credere_entries do |t|
      t.remove :id
      t.rename :temp_id, :id
    end

    execute "ALTER TABLE credere_entries ADD PRIMARY KEY (id);"
  end
end
