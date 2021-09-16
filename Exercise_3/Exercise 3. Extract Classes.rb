# frozen_string_literal: true
require 'bill_counter'
require 'sms_notifier'

class TipsProcessor

  def initialize(form:)
    @form = form
  end

  def call
    SmsNotifier.new.call(text: sms_text)
  end

  private

  attr_reader :form

  def sms_text
    "You tips have been processed. Total amount is: #{total_amount}"
  end

  def total_amount
    BillCounter.new(form: form).call
  end

end

mocked_form = { amount: 100, discount_percentage:0, tax_rate: 0.05, tip_percentage: 1  }
TipsProcessor.new(form: mocked_form).call
