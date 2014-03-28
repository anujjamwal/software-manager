require "spec_helper"

describe RequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/requests").should route_to("requests#index")
    end

    it "routes to #new" do
      get("/softwares/1/requests/new").should route_to("requests#new", software_id: '1')
    end

    it "routes to #create" do
      post("/softwares/1/requests").should route_to("requests#create", software_id: '1')
    end

    it "routes to #destroy" do
      delete("/softwares/1/requests/1").should route_to("requests#destroy", :id => "1", software_id: '1')
    end

  end
end
