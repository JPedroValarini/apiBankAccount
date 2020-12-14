require 'rails_helper'

RSpec.describe Account, type: :model do
  context '.open' do
    let(:user) { create(:user) }
    let(:params) { { name: 'joao', balance: 0, user: user } }

    it 'create a account' do
      expect(described_class.open(params)).to eq(true)
    end
  end

  context '.deposit' do
    let(:deposit_amount) { 100 }
    let(:account) {create(:account)}
    it 'increases balance by the deposit value' do
      # expect{ described_class.deposit(account, deposit_amount) }.to change{ subject.balance }.by deposit_amount
      expect(described_class.deposit(account, deposit_amount)).to eq(true)
      expect(account.balance).to eq(100)
    end

    it "when invalid amount is given" do
      deposit_amount = -5
      expect(described_class.deposit(account, deposit_amount)).to eq(false)
      expect(account.balance).to eq(0)
    end
  end

  context '.withdraw' do
    let(:withdraw_amount) { 50 }
    let(:account) { create(:account)}
    it 'when valid withdraw' do
      expect(described_class.withdraw(account, withdraw_amount)).to eq(true)
    end
  end

  context '.transfer' do
    let(:transfer_amount) { 20 }
    let(:account) {create(:account, balance: 50)}
    let(:recipient) {create(:account, balance: 10)}
    it 'transfer the balance by the deposit amount' do
      expect(described_class.transfer(account, recipient, transfer_amount)).to eq(true)
      expect(account.balance).to eq(30)
      expect(recipient.balance).to eq(30)
    end
  end
end

    