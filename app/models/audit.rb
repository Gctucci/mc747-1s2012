# == Schema Information
#
# Table name: audits
#
#  id          :integer         not null, primary key
#  tipousuario :integer
#  mudancas    :text
#  idchamado   :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Audit < ActiveRecord::Base
  attr_accessible :mudancas, :tipousuario, :idchamado
  serialize :mudancas

  USER_OPTIONS = { 'Usuario' => 1, 'Atendente' => 2 }
  before_create :skip_unchanged

  def skip_unchanged 
    return false if read_attribute(:mudancas).blank?
    return true
  end
  private :skip_unchanged
end
