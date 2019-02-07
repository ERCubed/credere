require 'spec_helper'

module Credere
  describe AccountsController do
    routes { Credere::Engine.routes }

    describe "routing" do
      it "recognizes and generates #index" do
        expect(:get => "/accounts").to route_to(:controller => "credere/accounts", :action => "index")
      end
    end
  end
end
