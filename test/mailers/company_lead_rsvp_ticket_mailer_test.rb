require 'test_helper'

class CompanyLeadRsvpTicketMailerTest < ActionMailer::TestCase
  test "company_lead_rsvp_ticket" do
    mail = CompanyLeadRsvpTicketMailer.company_lead_rsvp_ticket
    assert_equal "Company lead rsvp ticket", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
