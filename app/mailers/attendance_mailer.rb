class AttendanceMailer < ApplicationMailer
	default from: 'no_reply@monsite.fr' #soit méthode d'envoi défini ici soit celle qui sera définie dans la méthodee

def welcome_event_send(user, event)
	@user = user 
	@event = event
	@admin = event.administrator
	# c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
	mail(to: @admin.email, subject: "Nouveau participant à #{@event.title}") 
end
end