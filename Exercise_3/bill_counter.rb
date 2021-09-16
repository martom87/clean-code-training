class BillCounter

  def initialize (form: {})
    @amount = form.dig(:amount)
    @discount_percentage = form.dig(:discount_percentage)
    @tax_rate = form.dig(:tax_rate)
    @tip_percentage = form.dig(:tip_percentage)
  end

  def call
    amount + tax + tip - discount
  end

  private

  attr_reader :amount, :discount_percentage, :tax_rate, :tip_percentage

  def tax
    amount * tax_rate
  end

  def discount
    amount * (discount_percentage / 100.0)
  end

  def tip
    amount * (tip_percentage / 100.0)
  end
end

# BillCounter.new(form: { amount: 100, discount_percentage:0, tax_rate: 0.05, tip_percentage: 1  }).call
