require "spec_helper"

describe SoftwaresController do
  describe "routing" do

    it "routes to #index for os" do
      get("/windows/softwares").should route_to("softwares#index", os: 'windows')
    end

    it "routes to #index" do
      get("/softwares").should route_to("softwares#index")
    end

    it "routes to #new" do
      get("/softwares/new").should route_to("softwares#new")
    end

    it "routes to #show" do
      get("/softwares/1").should route_to("softwares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/softwares/1/edit").should route_to("softwares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/softwares").should route_to("softwares#create")
    end

    it "routes to #update" do
      put("/softwares/1").should route_to("softwares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/softwares/1").should route_to("softwares#destroy", :id => "1")
    end

    it "routes to #download" do
      get("/softwares/1/download").should route_to("softwares#download", :id => "1")
    end

  end
end
