require 'account'
require 'statement'

RSpec.describe Account do
    let(:account) {Account.new}
    # let asks the database once and saves the account object locally
    before do 
        # before aks the database before each spec
        @time_now = Time.now.strftime('%d/%m/%y')
        # time format according to the what i put in the given format string.

  
    describe "deposit" do
      it "adds the deposited amount to the balance" do
        account.deposit(100)
        expect(account.current_bal).to eq(100)
      end
    end
  
    describe "withdraw" do
      it "subtracts the withdrawn amount from the balance" do
        account.deposit(200)
        account.withdraw(100)
        expect(account.current_bal).to eq(100)
      end
  
      it "raises an error when you try to withdraw more than the current balance" do
        expect { account.withdraw(200) }.to raise_error 'Your withdrawal exceeds your current balance.'
      end
    end
  
    describe "Printing the statement" do
      before do
        account.deposit(1000)
      end
  
      it "grabs previous deposit and prints out the bank statement incl. date, transaction and current balance" do
        expect { account.print_statement }.to output("date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 1000.00 ||  || 1000.00\n").to_stdout
      end
    end

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