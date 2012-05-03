# == Schema Information
#
# Table name: chamados
#
#  id            :integer         not null, primary key
#  idsolicitante :integer
#  idproduto     :integer
#  idpedido      :integer
#  descricao     :text
#  tipochamado   :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  status        :integer
#

require 'spec_helper'

describe Chamado do

  before do
    @chamado = Chamado.new(idsolicitante: 42, idproduto: 20, idpedido:315,
                          descricao: "Problemas com a entrega do pedido",
                          tipochamado: 2)
  end

  subject { @chamado }

  it { should respond_to(:idsolicitante) }
  it { should respond_to(:idproduto) }
  it { should respond_to(:idpedido) }
  it { should respond_to(:descricao) }
  it { should respond_to(:tipochamado) }

  it { should be_valid }
end
