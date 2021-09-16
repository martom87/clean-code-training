# frozen_string_literal: true

class PhoneNumberFormatValidator < ActiveModel::Validator
  PHONE_REGEX = /^[0-9]{9}$/

  def validate(record)
    unless valid_phone_number?(record)
      record.errors[:phone_number] << "invalid phone number format"
    end
  end

  private

  def valid_phone_number?(record)
    return true if empty_phone_number?(record)

    correctly_formatted_phone_number?(record)
  end

  def empty_phone_number?(record)
    record.phone_number.nil?
  end

  def correctly_formatted_phone_number?(record)
    record.phone_number.match?(PHONE_REGEX)
  end
end
