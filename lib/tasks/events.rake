
namespace :events do
  desc "Delete event after 12 hours from date"
  task delete_12_hours_old: :environment do
    Event.where(['date < ?', 12.hours.ago]).destroy_all
  end

end
