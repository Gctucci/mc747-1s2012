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

require 'spec_helper'

describe Audit do
  pending "add some examples to (or delete) #{__FILE__}"
end
