require "spec_helper"

describe ChamadosController do
  describe "routing" do

    it "routes to #index" do
      get("/chamados").should route_to("chamados#index")
    end

    it "routes to #new" do
      get("/chamados/new").should route_to("chamados#new")
    end

    it "routes to #show" do
      get("/chamados/1").should route_to("chamados#show", :id => "1")
    end

    it "routes to #edit" do
      get("/chamados/1/edit").should route_to("chamados#edit", :id => "1")
    end

    it "routes to #create" do
      post("/chamados").should route_to("chamados#create")
    end

    it "routes to #update" do
      put("/chamados/1").should route_to("chamados#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/chamados/1").should route_to("chamados#destroy", :id => "1")
    end

  end
end
