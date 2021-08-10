class UserMailer < ApplicationMailer
	default from: 'no_reply@monsite.fr' #soit méthode d'envoi défini ici soit celle qui sera définie dans la méthodee

  def welcome_email(user)

	@user = user #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user

	@url = '/' #on définit une variable @url qu'on utilisera dans la view d’e-mail

	mail(to: @user.email, subject: 'Bienvenue chez nous !') # cet appel à mail()  permet d'envoyer l’e-mail avec destinataire et sujet.

end
end
