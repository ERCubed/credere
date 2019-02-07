require 'spec_helper'

module Credere
  describe Expense do
    it_behaves_like 'a Credere::Account subtype', kind: :expense, normal_balance: :debit
  end
end
