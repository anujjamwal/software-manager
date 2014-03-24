require "spec_helper"

describe LicensesController do
  describe "routing" do

    it "routes to #index" do
      get("/softwares/1/licenses").should route_to("licenses#index", software_id: '1')
    end

    it "routes to #new" do
      get("/softwares/1/licenses/new").should route_to("licenses#new", software_id: '1')
    end

    it "routes to #show" do
      get("/softwares/1/licenses/1").should route_to("licenses#show", :id => "1", software_id: '1')
    end

    it "routes to #edit" do
      get("/softwares/1/licenses/1/edit").should route_to("licenses#edit", :id => "1", software_id: '1')
    end

    it "routes to #create" do
      post("/softwares/1/licenses").should route_to("licenses#create", software_id: '1')
    end

    it "routes to #update" do
      put("/softwares/1/licenses/1").should route_to("licenses#update", :id => "1", software_id: '1')
    end

    it "routes to #destroy" do
      delete("/softwares/1/licenses/1").should route_to("licenses#destroy", :id => "1", software_id: '1')
    end

  end
end
