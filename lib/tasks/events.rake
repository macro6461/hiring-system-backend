
namespace :events do

  desc "Delete event after 12 hours from date"
  task delete_12_hours_old: :environment do
    Event.where('end_date <= ?', Time.now-12.hours).destroy_all
  end

end
