class ApplicationController < ActionController::Base
  $vapid_private =  "0c8nRw0cZSvuK_JoztrVkWBwmy9bfyzCOIBAOimCR-s=" 
  $vapid_public = Base64.urlsafe_decode64('BHtkXy1aqJecknsBfcXJyfkTeLZlqAucb-UyegDhvnyrie_mscYibSaYc0TYCdnGl1KS06ShQ7zdkNuYEQjfyGc').bytes

end
