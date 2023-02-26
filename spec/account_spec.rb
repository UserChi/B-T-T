require 'account'
require 'statement'

RSpec.describe Account do
    let(:account) {Account.new}
    # let asks the database once and saves the account object locally
    before do 
        # before aks the database before each spec
        @time_now = Time.now.strftime('%d/%m/%y')
        # time format according to the what i put in the given format string.
    end
  end

RSpec.describe Account do
    describe "has a default balance of 0" do
      it "returns 0 as the current balance" do
        account = Account.new
        expect(account.current_bal).to eq(0)
      end
    end
  end

  RSpec.describe Account do
    describe "#deposit" do
      it "adds 100 to the balance" do
        account = Account.new
        account.deposit(100)
        expect(account.current_bal).to eq(100)
      end
    end
  end
  
  
# describe'Balance' do
#     it 'has a default balance of 0' do
#         expect(account.current_bal).to eq(0)
#     end
# end

# describe 'Deposit' do
#     it 'adds 100 to the balance' do
#       account.deposit(100)
#       expect(account.current_bal).to eq(100)
#     end
#   end

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

  describe 'Printing the statement' do

    it 'grabs previous deposit and prints out the bank statement incl. date, transaction and current balance.' do 
    account.deposit(1000)
    statement = <<~STATEMENT
    date || credit || debit || balance
    #{@time_now} || 1000.00 || || 1000.00
    
    STATEMENT
    
    expect { account.statement }.to output(statement).to_stdout
    # end

    it 'grabs previous transactions and prints out the bank statement incl. date, transaction and current balance.' do
        account.deposit(1000)
        account.withdraw(500)
        allow(Time).to receive(:now).and_return(@time_now)
        statement = <<~STATEMENT
        date || credit || debit || balance
        #{@time_now} || || 500.00 || 500.00
        #{@time_now} || 1000.00 || || 1000.00
        STATEMENT
        expect { account.statement }.to output(statement).to_stdout
      end
    end    
  end