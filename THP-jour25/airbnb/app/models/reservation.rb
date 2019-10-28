class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :listing
  
  validates :start_date, :end_date,
    presence: true
  validate :start_must_be_before_end_date # , :overlaping_reservation?

  def overlaping_reservation?(datetime)
    reservation = Reservation.all
    reservation.each do |resa|
      errors.add(:start_date, "est une date déjà réservée") if datetime > resa.start_date && datetime < resa.end_date
    end
  end

  def start_must_be_before_end_date
    errors.add(:start_date, "doit être avant la date de fin") unless start_date < end_date
  end

  def duration
    (self.end_date - self.start_date) / 86400
  end

end
