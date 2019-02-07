FactoryGirl.define do
  factory :account, :class => Credere::Account do |account|
    account.name
    account.contra false
  end

  factory :asset, :class => Credere::Asset do |account|
    account.name
    account.contra false
  end

  factory :equity, :class => Credere::Equity do |account|
    account.name
    account.contra false
  end

  factory :expense, :class => Credere::Expense do |account|
    account.name
    account.contra false
  end

  factory :liability, :class => Credere::Liability do |account|
    account.name
    account.contra false
  end

  factory :revenue, :class => Credere::Revenue do |account|
    account.name
    account.contra false
  end

  sequence :name do |n|
    "Factory Name #{n}"
  end
end
