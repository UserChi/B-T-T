require Statement
require Transaction
require 'date'

class Account
    attr_reader :current_bal
    #only read the value can't change it

    def initalize 
        @current_bal = 0
        @transactions = []
    end

    def deposit(amount)
        @current_bal += amount
        create_transaction(amount)
      end


    def withdraw(amount)
       raise 'Your withdrawal exceeds your current balance.' if amount > @current_bal
       @current_bal -= amount
       create_transaction(amount, 'credit')
     end

    def statement(statement_class = Statement)
        statement_class.print(@transactions.reverse)
        end

    def create_transaction(amount, type=nil, transaction_class = Transaction)

         @transactions << transaction_class.create(amount, @current_bal, type)   
        end
            
         private :create_transaction   
        end