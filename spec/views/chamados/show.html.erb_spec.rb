require 'spec_helper'

describe "chamados/show" do
  before(:each) do
    @chamado = assign(:chamado, stub_model(Chamado,
      :idsolicitante => 1,
      :idproduto => 2,
      :idpedido => 3,
      :descricao => "MyText",
      :tipochamado => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/MyText/)
    rendered.should match(/4/)
  end
end
