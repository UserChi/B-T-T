require 'date'

class Account
    attr_reader :current_bal
    #only read the value can't change it

    def initalize 
        @current_bal = 0
    end
