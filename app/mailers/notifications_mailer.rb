class NotificationsMailer < ActionMailer::Base
 	default :from => "kristinka-cherry@mail.ru"
  	default :to => "nicolanice8362@gmail.com"

  	def new_message(message)
   		@message = message
    	mail(:subject => "[YourWebsite.tld] #{message.subject}")
  	end
end
