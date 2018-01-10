module CompanyLeadRsvpTicketsHelper

  def date(data)
    byebug

    day = "#{data}".split(" ")[0].split("-")[2]
    month = "#{data}".split(" ")[0].split("-")[1]
    year = "#{data}".split(" ")[0].split("-")[0]
    date = "#{month}/#{day}/#{year}"

    return date
  end

  def time(data)
    mins = "#{data}".split(" ")[1].split(":")[1]
    time = Time.strptime("#{data}".split(" ")[1], "%H:%M").strftime("%I:%P").split(":").insert(1, ":#{mins}").join("")
    return time
  end

end
