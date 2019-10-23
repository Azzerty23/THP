require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees
  all_events = []
  all_event_days = []
  
  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
                      .strftime("%d/%m/%Y %H:%M:%S")
    @duration = duration
    @title = title
    @attendees = attendees
    @@all_events << self
  end

  def postpone_24h
    @start_date = self.start_date + 86400
  end

  def end_date
    return @start_date + @duration*60
  end

  def is_past?
    return @start_date > Time.now
  end

  def is_future?
    return !is_past?
  end

  def is_soon?
    return is_past? && @start_date > Time.now - 1800 
  end

  def to_s
    puts ">Titre : #{@title}"
    puts ">Date de début : #{@start_date}"
    puts ">Durée : #{@duration * 60} minutes"
    puts ">Invités : #{@attendees}"
  end

  def self.all_events
    return @@all_events
  end

  def self.all_event_days
    for event in @@all_events
      all_event_days << event.start_date.strftime("%d")
    end
  end

end