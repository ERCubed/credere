require 'spec_helper'

module Credere
  describe CreditAmount do
    it_behaves_like 'a Credere::Amount subtype', kind: :credit_amount
  end
end
