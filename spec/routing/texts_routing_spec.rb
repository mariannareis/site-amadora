require "spec_helper"

describe TextsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/texts" }.should route_to(:controller => "texts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/texts/new" }.should route_to(:controller => "texts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/texts/1" }.should route_to(:controller => "texts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/texts/1/edit" }.should route_to(:controller => "texts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/texts" }.should route_to(:controller => "texts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/texts/1" }.should route_to(:controller => "texts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/texts/1" }.should route_to(:controller => "texts", :action => "destroy", :id => "1")
    end

  end
end
