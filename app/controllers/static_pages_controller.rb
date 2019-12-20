class StaticPagesController < ApplicationController
  before_action :authenticate_user!	
  $vapid_private = "48e-I288Qi9Caboi8enKfhffslSpx9Eas5OjsuETAXg="   
  $vapid_public = "BL9fMz34qqu63XxdheE663mRJRNuqqIL3vR19iqqrhq9XXo04ejetNSRw0yOG7tqsQZVU-jrGb8hYfeJZjhZAkY="


  def user
  @h = User.all.to_json
  @notif = NotificationDatum.all.to_json
  	
  end
  def home
  	@device = CallApi.new.get_device

  end


def sendPush
	user = current_user
		notif_data = NotificationDatum.create(endpoint: params[:subscription][:endpoint],
		                        p256dh_key: params[:subscription][:keys][:p256dh],
		                        auth_key: params[:subscription][:keys][:auth])
		# User.where(auth_key: params[:subscription][:keys][:auth]).destroy_all
		user.update(auth_key: params[:subscription][:keys][:auth], :notif_id => notif_data.id)
		m = params[:message]
		sendPayload(user, m)
		render body: nil
	end

	def sendPayload(user, m)
	    @message = m
	    if user.notif_id.present?
	      @notification_data = NotificationDatum.find(user.notif_id)
	      Webpush.payload_send(endpoint: @notification_data.endpoint,
	                           message: @message,
	                           p256dh: @notification_data.p256dh_key,
	                           auth: @notification_data.auth_key,
	                           ttl: 24 * 60 * 60,
	                           urgency: 'normal',
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

    def get_message(m)
    	
    	message = {
  title: "title",
  body: m,
  
}
    end
end
