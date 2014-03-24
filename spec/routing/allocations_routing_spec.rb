require "spec_helper"

describe AllocationsController do
  describe "routing" do

    it "routes to #index" do
      get("/licenses/1/allocations").should route_to("allocations#index", license_id: '1')
    end

    it "routes to #new" do
      get("/licenses/1/allocations/new").should route_to("allocations#new", license_id: '1')
    end

    it "routes to #show" do
      get("/licenses/1/allocations/1").should route_to("allocations#show", :id => "1", license_id: '1')
    end

    it "routes to #edit" do
      get("/licenses/1/allocations/1/edit").should route_to("allocations#edit", :id => "1", license_id: '1')
    end

    it "routes to #create" do
      post("/licenses/1/allocations").should route_to("allocations#create", license_id: '1')
    end

    it "routes to #update" do
      put("/licenses/1/allocations/1").should route_to("allocations#update", :id => "1", license_id: '1')
    end

    it "routes to #destroy" do
      delete("/licenses/1/allocations/1").should route_to("allocations#destroy", :id => "1", license_id: '1')
    end

  end
end
