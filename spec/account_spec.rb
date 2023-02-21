require 'account'

Rspec.describe Account do
    let(:account) {Account.new}
    # let asks the database once and saves the account object locally
    before do 
        # before aks the database before each spec
        @time_now = Time.now.strftime(%d/%m/%y)
        # time format according to the what i put in the given format string.
    end

describe'Balance' do
    it 'has a default balance of 0' do
        expect(account.current_bal).to eq(0)
    end
end

describe 'Deposit' do
    it 'adds 100 to the balance' do
      account.deposit(100)
      expect(account.current_bal).to eq(100)
    end
  end

  describe 'Withdraw' do
    it 'adds 100 then subtracts 50 from the balance' do
      account.deposit(100)
      account.withdraw(50)
      expect(account.current_bal).to eq(50)
    end

    it 'raises error when you try to withdraw more money than current balance.' do
      account.deposit(100)
      expect { account.withdraw(200) }.to raise_error 'Your withdrawal exceeds your current balance.'
    end
  end