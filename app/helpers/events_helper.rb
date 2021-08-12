module EventsHelper
    def already_subscribed?(event)
        event.participants.each do |participant|
            puts " Participant: #{participant.id}"
            puts " current: #{current_user.id}"
            if participant.id == current_user.id
                return true
            end
        end
        false
    end
end
