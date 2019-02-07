require 'spec_helper'

module Credere
  describe Asset do
    it_behaves_like 'a Credere::Account subtype', kind: :asset, normal_balance: :debit
  end
end
