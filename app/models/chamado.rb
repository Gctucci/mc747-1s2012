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

require 'track_changes.rb'
class Chamado < ActiveRecord::Base
  include TrackChanges
  attr_accessible :descricao, :idpedido, :idproduto, 
                  :idsolicitante, :tipochamado, :status
  CHAMADO_OPTIONS = { 'Reclamacao'  => 1, 'Sugestao' => 2 , 
                      'Troca' => 3, 'Duvida' => 4, 'Outro' => 5 }

  STATUS_OPTIONS = { 'Aberto' => 1, 'Fechado' => 2, 'Em Andamento' => 3, 'Cancelado' => 4}
  
  validates_inclusion_of :tipochamado, :in => CHAMADO_OPTIONS.values
  validates_inclusion_of :status, :in => STATUS_OPTIONS.values


end
