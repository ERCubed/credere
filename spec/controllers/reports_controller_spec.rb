require 'spec_helper'

module Credere
  describe ReportsController do
    routes { Credere::Engine.routes }

    def mock_entry(stubs={})
      @mock_entry ||= FactoryGirl.create(:entry_with_credit_and_debit)
    end

    describe "GET balance_sheet" do
      it "renders when one entry exists" do
        allow(Entry).to receive_message_chain(:order).and_return([mock_entry])
        get :balance_sheet
        expect(response).to be_success
      end
      it "renders when no entries exist" do
        allow(Entry).to receive_message_chain(:order).and_return([])
        get :balance_sheet
        expect(response).to be_success
      end
    end
  end
end
