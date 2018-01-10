# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Trainers
    Trainer.create(first_name: "brian", last_name: "letendre", email_address: "brian@bohemiarealtygroup.com", phone_number: "917-282-7998", url: "www.brians-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "corey", last_name: "wright", email_address: "corey@bohemiarealtygroup.com", phone_number: "917-370-6394", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "dan", last_name: "cohen", email_address: "dan@bohemiarealtygroup.com", phone_number: "347-528-5436", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "david", last_name: "ellis", email_address: "david@bohemiarealtygroup.com", phone_number: "917-319-5471", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "emily", last_name: "ackerman", email_address: "emily@bohemiarealtygroup.com", phone_number: "917-975-0619", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "daoud", last_name: "heidami", email_address: "daoud@bohemiarealtygroup.com", phone_number: "917-627-9320", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "jessica", last_name: "wagner", email_address: "jess@bohemiarealtygroup.com", phone_number: "973-615-4750", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "sam", last_name: "kiernan", email_address: "slkiernan@bohemiarealtygroup.com", phone_number: "617-771-4336", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "jill", last_name: "ginsberg", email_address: "jill@bohemiarealtygroup.com", phone_number: "781-454-7453", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "kevin", last_name: "martinez", email_address: "kmartinez@bohemiarealtygroup.com", phone_number: "806-441-2801", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "lindsay", last_name: "nelms", email_address: "lindsay@bohemiarealtygroup.com", phone_number: "603-312-0319", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "erin", last_name: "whitney", email_address: "erin@bohemiarealtygroup.com", phone_number: "917-940-5150", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "raphael", last_name: "fetta", email_address: "raphael@bohemiarealtygroup.com", phone_number: "917-519-2648", url: "www.lucys-unique-url.com", occupied: false, hold: false)

    Trainer.create(first_name: "jeremiah", last_name: "wiggins", email_address: "jeremiah@bohemiarealtygroup.com", phone_number: "917-596-2124", url: "www.lucys-unique-url.com", occupied: false, hold: false)


Event.create(title: "Bohemia January Hiring Event", start_date: DateTime.new(2018, 01, 10, 02, 46, 0), end_date: DateTime.new(2018, 01, 10, 02, 46, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")
Event.create(title: "Bohemia January Hiring Event", start_date: DateTime.new(2018, 01, 10, 02, 47, 0), end_date: DateTime.new(2018, 01, 10, 02, 47, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")
Event.create(title: "Bohemia January Hiring Event", start_date: DateTime.new(2018, 01, 10, 02, 48, 0), end_date: DateTime.new(2018, 01, 10, 02, 48, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#January Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - January", start_date: DateTime.new(2018, 01, 10, 19, 00, 0), end_date: DateTime.new(2018, 01, 10, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#February Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - February", start_date: DateTime.new(2018, 02, 21, 19, 00, 0), end_date: DateTime.new(2018, 02, 21, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#March Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - March", start_date: DateTime.new(2018, 03, 21, 19, 00, 0), end_date: DateTime.new(2018, 03, 21, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#April Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - April", start_date: DateTime.new(2018, 04, 18, 19, 00, 0), end_date: DateTime.new(2018, 04, 18, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#May Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - May", start_date: DateTime.new(2018, 05, 23, 19, 00, 0), end_date: DateTime.new(2018, 05, 23, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#June Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - June", start_date: DateTime.new(2018, 06, 27, 19, 00, 0), end_date: DateTime.new(2018, 06, 27, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#August Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - August", start_date: DateTime.new(2018, 8, 01, 19, 00, 0), end_date: DateTime.new(2018, 8, 01, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#September Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - September", start_date: DateTime.new(2018, 9, 12, 19, 00, 0), end_date: DateTime.new(2018, 9, 12, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#October Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - October", start_date: DateTime.new(2018, 10, 17, 19, 00, 0), end_date: DateTime.new(2018, 10, 17, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#November Event
    Event.create(title: "Bohemia Realty Group's Hiring Event - November", start_date: DateTime.new(2018, 11, 14, 19, 00, 0), end_date: DateTime.new(2018, 10, 14, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")

#December Event
    Event.create(title:"Bohemia Realty Group's Hiring Event - December", start_date: DateTime.new(2018, 12, 12, 19, 00, 0), end_date: DateTime.new(2018, 12, 12, 20, 30, 0), description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026")


#CompanyLeads
CompanyLead.create(first_name: "Jane", last_name: "Doe", email_address: "jane@doe.com", phone_number: "221-221-2221", licensed: true)

CompanyLead.create(first_name: "Paul", last_name: "Bunion", email_address: "paul@bunion.com", phone_number: "221-333-2221", licensed: false)

CompanyLead.create(first_name: "Joe", last_name: "Dileo", email_address: "joe@dileo.com", phone_number: "221-888-2221", licensed: true)


# #TrainerLeads
# TrainerLead.create(first_name: "Carrie", last_name: "Fischer", email_address: "joe@dileo.com", phone_number: "221-234-2221", licensed: true, trainer_id: 1, interview_trainer_id: nil)
#
# TrainerLead.create(first_name: "Susan", last_name: "Sarandon", email_address: "joe@dileo.com", phone_number: "111-234-2221", licensed: false, trainer_id: 1, interview_trainer_id: nil)

#CompanyLeadRsvps
    # CompanyLeadRsvp.create(title: "Bohemia Realty Group February Hiring Event", date: "Wednesday, February 21st, 7-8:30pm", description: "come to hiring event in december", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", company_lead_id: 1, event_id: 1)
    #
    # CompanyLeadRsvp.create(title: "Bohemia Realty Group February Hiring Event", date: "Wednesday, February 21st, 7-8:30pm", description: "come to hiring event in december", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", company_lead_id: 2, event_id: 1)
    #
    # CompanyLeadRsvp.create(title: "Bohemia Realty Group March Hiring Event", date: "Wednesday, March 21st, 7-8:30pm", description: "come to hiring event in december", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", company_lead_id: 3, event_id: 2)


# #TrainerLeadRsvps
#     TrainerLeadRsvp.create(title: "Bohemia Realty Group March Hiring Event", date: "Wednesday, March 21st, 7-8:30pm", description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", trainer_lead_id: 1, event_id: 2)
#
#     TrainerLeadRsvp.create(title: "Bohemia Realty Group March Hiring Event", date: "Wednesday, March 21st, 7-8:30pm", description: "Bohemia Realty Group is organizing a hiring event for all those interested in becoming a realtor!", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", trainer_lead_id: 2, event_id: 3)
#
# #TrainerLeadInterviews
#     TrainerLeadInterview.create(title: "Brian Interview with Carrie Fischer", date: "Thursday, January 11th, 3-4:00pm", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", trainer_lead_id: 1)
#
#     TrainerLeadInterview.create(title: "Brian Interview with Susan Sarandon", date: "Friday, January 12th, 2-3:00pm", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", trainer_lead_id: 2) #no trainer yet
#
# #CompanyLeadInterviews
  # CompanyLeadInterview.create(date: "Thursday, February 22nd, 2-3:00pm", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", company_lead_id: 1) #no trainer yet
  #
  # CompanyLeadInterview.create(date: "Friday, February 23nd, 1-2:00pm", location: "2101 Frederick Douglass Boulevard, New York, NY 10026", company_lead_id: 3) #no trainer yet
