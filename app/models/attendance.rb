class Attendance < ApplicationRecord
  # after_create :welcome_event_send
  
  belongs_to :participant, class_name: "User"
  belongs_to :event

  # def welcome_event_send
  #   AttendanceMailer.welcome_event_email(self.participant, self.event).deliver_now #appel le mailer UserMailer et l'envoi direct
  # end

end