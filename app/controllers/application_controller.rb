class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
 $vapid_private = "48e-I288Qi9Caboi8enKfhffslSpx9Eas5OjsuETAXg="   
  $vapid_public = "BL9fMz34qqu63XxdheE663mRJRNuqqIL3vR19iqqrhq9XXo04ejetNSRw0yOG7tqsQZVU-jrGb8hYfeJZjhZAkY="

end
