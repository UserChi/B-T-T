require 'statement'

RSpec.describe Statement do

   let(:credit_transaction) { double :transaction, date: Date.today, amount: 1000, current_bal: 1000, type: nil }
   let(:debit_transaction) { double :transaction, date: Date.today, amount: 500, current_bal: 500, type: 'credit' }
   let(:credit_transactions) { [credit_transaction] }
   let(:debit_transactions) { [debit_transaction] }
  
describe 'print' do
    it 'prints the correct format of the credit transaction' do
      print_statement = <<~STATEMENT
      date || credit || debit || balance
      #{Date.today} || 1000.00 || || 1000.00
      STATEMENT
  expect {Statement.print(credit_transactions)}.to output(print_statement).to_stdout
end

      it 'prints the correct format of the debit transaction' do
       print_statement = <<~STATEMENT
       date || credit || debit || balance
       #{Date.today} || || 500.00 || 500.00
       STATEMENT
  expect {Statement.print(debit_transactions)}.to output(print_statement).to_stdout
  end
end

describe 'isCredit?' do
    it 'can tell that a transaction is a deposit' do
  expect(Statement.is_credit?(credit_transaction)).to eq(nil)
end

    it 'can tell that a withdrawal changes the type of the transaction to a credit' do
 expect(Statement.is_credit?(debit_transaction)).to eq(true)

  end
 end
end