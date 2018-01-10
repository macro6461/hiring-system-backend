class SorryMailer < ApplicationMailer



      def sorry(absentee)
        byebug
        @absentee = absentee

        mail(to: @absentee.email_address, subject: "Sorry we missed you")

      end



end
