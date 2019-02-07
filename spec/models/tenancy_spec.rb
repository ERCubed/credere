require 'spec_helper'

module Credere
  describe Account do
    describe 'tenancy support' do
      before(:each) do
        ActiveSupportHelpers.clear_model('Account')
        ActiveSupportHelpers.clear_model('Asset')

        Credere.enable_tenancy = true
        Credere.tenant_class = 'Credere::Entry'

        FactoryGirlHelpers.reload()
        Credere::Asset.new
      end

      after(:each) do
        if Credere.const_defined?(:Asset)
          ActiveSupportHelpers.clear_model('Account')
          ActiveSupportHelpers.clear_model('Asset')
        end

        Credere.enable_tenancy = false
        Credere.tenant_class = nil

        FactoryGirlHelpers.reload()
      end

      it 'validate uniqueness of name scoped to tenant' do
        account = FactoryGirl.create(:asset, tenant_id: 10)

        record = FactoryGirl.build(:asset, name: account.name, tenant_id: 10)
        expect(record).not_to be_valid
        expect(record.errors[:name]).to eq(['has already been taken'])
      end

      it 'allows same name scoped under a different tenant' do
        account = FactoryGirl.create(:asset, tenant_id: 10)

        record = FactoryGirl.build(:asset, name: account.name, tenant_id: 11)
        expect(record).to be_valid
      end
    end
  end
end
