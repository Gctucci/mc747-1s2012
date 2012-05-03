class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.integer :tipousuario
      t.text :mudancas
      t.integer :idchamado

      t.timestamps
    end
  end
end
