class StaticPagesController < ApplicationController
	
  $vapid_private = "48e-I288Qi9Caboi8enKfhffslSpx9Eas5OjsuETAXg="   
  $vapid_public = "BL9fMz34qqu63XxdheE663mRJRNuqqIL3vR19iqqrhq9XXo04ejetNSRw0yOG7tqsQZVU-jrGb8hYfeJZjhZAkY="


  def index
  	
  end
  def home
  	@device = CallApi.new.get_device
  end


def sendPush
		notif_data = NotificationDatum.create(endpoint: params[:subscription][:endpoint],
		                        p256dh_key: params[:subscription][:keys][:p256dh],
		                        auth_key: params[:subscription][:keys][:auth])
		User.where(auth_key: params[:subscription][:keys][:auth]).destroy_all
		user = User.create(auth_key: params[:subscription][:keys][:auth], :notif_id => notif_data.id)
		sendPayload(user)
		render body: nil
	end

	def sendPayload(user)
	    message = {
  title: "title",
  body: "body",
  icon: "https://webpratik.fr/wp-content/uploads/2019/01/logo_herde01-1-1004x1024.png"
}
	    if user.notif_id.present?
	      @notification_data = NotificationDatum.find(user.notif_id)
	      Webpush.payload_send(endpoint: @notification_data.endpoint,
	                           message: message.to_json,
	                           p256dh: @notification_data.p256dh_key,
	                           auth: @notification_data.auth_key,
	                           ttl: 24 * 60 * 60,
	                           vapid: {
	                               subject: 'mailto:admin@commercialview.com.au',
	                               public_key: $vapid_public,
	                               private_key: $vapid_private
	                           }
	      )
	      puts "success"
	    else
	      puts "failed"
	    end
    end

    def get_message(name)
    	"Hello World"
    end
end
