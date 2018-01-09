module CompanyLeadInterviewsHelper

  def full_name(data)
    x = "#{data.first_name} #{data.last_name}"
    return x.titleize
  end

end
