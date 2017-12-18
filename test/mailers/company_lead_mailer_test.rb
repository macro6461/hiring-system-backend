require 'test_helper'

class CompanyLeadMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "invite" do
    # Create the email and store it for further assertions
    email = CompanyLeadMailer.create_invite('mattcroakl718@gmail.com',
                                     'mattcroak718@yahoo.com', Time.now)

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['mattcroakl718@gmail.com'], email.from
    assert_equal ['mattcroak718@yahoo.com'], email.to
    assert_equal 'You have been invited by mattcroakl718@gmail.com', email.subject
    assert_equal read_fixture('invite').join, email.body.to_s
  end
end
