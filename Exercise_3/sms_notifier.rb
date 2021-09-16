# frozen_string_literal: true

class SmsNotifier

  def call(text: )
    puts "Sent sms with content: #{text}"
  end
end
