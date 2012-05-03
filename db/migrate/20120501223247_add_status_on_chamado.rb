class AddStatusOnChamado < ActiveRecord::Migration 
  def change
    add_column :chamados, :status, :integer
  end
end
