require 'spec_helper'

module Credere
  describe EntriesController do
    routes { Credere::Engine.routes }

    describe "routing" do
      it "recognizes and generates #index" do
        expect(:get => "/entries").to route_to(:controller => "credere/entries", :action => "index")
      end
    end
  end
end
