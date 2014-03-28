require "spec_helper"

describe ApplicationController do
  describe "routing" do
    it "routes to #home" do
      get("/").should route_to("application#home")
    end
  end
end
