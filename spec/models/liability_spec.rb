require 'spec_helper'

module Credere
  describe Liability do
    it_behaves_like 'a Credere::Account subtype', kind: :liability, normal_balance: :credit
  end
end