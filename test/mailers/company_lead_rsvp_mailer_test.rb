require 'test_helper'

class CompanyLeadRsvpMailerTest < ActionMailer::TestCase
  test "company_lead_rsvp" do
    mail = CompanyLeadRsvpMailer.company_lead_rsvp
    assert_equal "Company lead rsvp", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
