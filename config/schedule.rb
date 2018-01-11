# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 2.minutes do
  rake "events:delete_12_hours_old"
end

every :wednesday, :at => '7:10pm' do
  rake "events:send_email_one_week"
end

every :tuesday, :at => "7:10pm" do
  rake "events:send_email_one_day"
end
#t
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever