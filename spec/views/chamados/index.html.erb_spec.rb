require 'spec_helper'

describe "chamados/index" do
  before(:each) do
    assign(:chamados, [
      stub_model(Chamado,
        :idsolicitante => 1,
        :idproduto => 2,
        :idpedido => 3,
        :descricao => "MyText",
        :tipochamado => 4
      ),
      stub_model(Chamado,
        :idsolicitante => 1,
        :idproduto => 2,
        :idpedido => 3,
        :descricao => "MyText",
        :tipochamado => 4
      )
    ])
  end

  it "renders a list of chamados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
