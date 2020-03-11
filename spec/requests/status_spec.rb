require 'rails_helper'


describe "routing to drivers" do
  it "routes /drivers to drivers#index" do
    expect(get: "/drivers").to route_to(
      controller: "drivers",
      action: "index"
    )
  end
 end