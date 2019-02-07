require 'spec_helper'

module Credere
  describe Amount do
    subject { FactoryGirl.build(:amount) }
    it { is_expected.not_to be_valid }  # construct a child class instead
  end
end
