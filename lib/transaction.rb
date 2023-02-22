class Transaction
    attr_reader :date, :amount, :current_bal, :type
    
    def initialize(amount, current_balance, type)
      @date = DateTime.now.strftime '%d/%m/%Y'
      @amount = amount
      @current_bal = current_bal
      @type = type
    
    end
    
    def self.create(amount, current_bal, type)
    
    Transaction.new(amount, current_bal, type)
    
    end
end