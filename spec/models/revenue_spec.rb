require 'spec_helper'

module Credere
  describe Revenue do
    it_behaves_like 'a Credere::Account subtype', kind: :revenue, normal_balance: :credit
  end
end