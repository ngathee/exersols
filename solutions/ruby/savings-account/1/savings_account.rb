module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      rate = 3.213
    elsif balance < 1000
      rate = 0.5
    elsif balance < 5000
      rate = 1.621
    else
      rate = 2.475
    end
    rate 
  end

  def self.annual_balance_update(balance)
    annual_balance = balance + (balance * interest_rate(balance)/100)
    annual_balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year_count = 0
    while current_balance <= desired_balance 
      current_balance = annual_balance_update(current_balance)
      year_count += 1
    end
    year_count 
  end
end
