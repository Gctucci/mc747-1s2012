class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.integer :idsolicitante
      t.integer :idproduto
      t.integer :idpedido
      t.text :descricao
      t.integer :tipochamado

      t.timestamps
    end
  end
end
