require 'spec_helper'

module Credere
  describe DebitAmount do
    it_behaves_like 'a Credere::Amount subtype', kind: :debit_amount
  end
end
