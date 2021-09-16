# frozen_string_literal: true

class Tipper

  def initialize(amount:, discount_percentage: 0, tax_rate: 0.05, tip_percentage:)
    @amount = amount
    @discount_percentage = discount_percentage
    @tax_rate = tax_rate
    @tip_percentage = tip_percentage
  end

  def total
    tax = amount * tax_rate
    discount = amount * (discount_percentage / 100.0)
    tip = amount * (tip_percentage / 100.0)
    amount + tax + tip - discount
  end

  private

  attr_reader :amount, :discount_percentage, :tax_rate, :tip_percentage

end

Tipper.new(amount: 100, tip_percentage: 5).total
