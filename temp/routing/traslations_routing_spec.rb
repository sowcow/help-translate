require "spec_helper"

describe TraslationsController do
  describe "routing" do

    it "routes to #index" do
      get("/traslations").should route_to("traslations#index")
    end

    it "routes to #new" do
      get("/traslations/new").should route_to("traslations#new")
    end

    it "routes to #show" do
      get("/traslations/1").should route_to("traslations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/traslations/1/edit").should route_to("traslations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/traslations").should route_to("traslations#create")
    end

    it "routes to #update" do
      put("/traslations/1").should route_to("traslations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/traslations/1").should route_to("traslations#destroy", :id => "1")
    end

  end
end
