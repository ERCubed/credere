class TenantCredereTables < ActiveRecord::Migration\[5\.2\]
  def change
    # add a tenant column to credere accounts table.
    add_column :credere_accounts, :tenant_id, :integer, index: true
  end
end
