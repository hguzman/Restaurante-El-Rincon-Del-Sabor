require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "bienvenida_mailer" do
    mail = UserMailer.bienvenida_mailer
    assert_equal "Bienvenida mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
