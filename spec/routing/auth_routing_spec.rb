require "spec_helper"

describe AuthController do
  describe "routing" do

    it "routes to #create" do
      post("/auth/okta/callback").should route_to("auth#create", "provider"=>"okta")
    end

  end
end
