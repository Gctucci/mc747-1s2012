require 'spec_helper'

describe "chamados/new" do
  before(:each) do
    assign(:chamado, stub_model(Chamado,
      :idsolicitante => 1,
      :idproduto => 1,
      :idpedido => 1,
      :descricao => "MyText",
      :tipochamado => 1
    ).as_new_record)
  end

  it "renders new chamado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => chamados_path, :method => "post" do
      assert_select "input#chamado_idsolicitante", :name => "chamado[idsolicitante]"
      assert_select "input#chamado_idproduto", :name => "chamado[idproduto]"
      assert_select "input#chamado_idpedido", :name => "chamado[idpedido]"
      assert_select "textarea#chamado_descricao", :name => "chamado[descricao]"
      assert_select "input#chamado_tipochamado", :name => "chamado[tipochamado]"
    end
  end
end
