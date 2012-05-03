class AddIndexInAudit < ActiveRecord::Migration
  def change
    add_index :audits, :idchamado
  end
end
