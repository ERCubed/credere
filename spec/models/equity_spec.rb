require 'spec_helper'

module Credere
  describe Equity do
    it_behaves_like 'a Credere::Account subtype', kind: :equity, normal_balance: :credit
  end
end
