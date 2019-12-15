// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require materialize
//= require serviceworker-companion
//= require test
//= require chartkick
//= require Chart.bundle

		function sendPush() {
		getKeys(false)
	}
	var vapidPublicKey = new Uint8Array("#{Base64.urlsafe_decode64($vapid_public).bytes}");
	// var vapidPublicKey = ("#{$vapid_public}");

   function checkNotifs(obj){
      if (!("Notification" in window)) {                                             //1
           console.error("This browser does not support desktop notification");
         }
         // Let's check whether notification permissions have already been granted
         else if (Notification.permission === "granted") {                           //2
           console.log("Permission to receive notifications has been granted");
           getKeys();
         }
         // Otherwise, we need to ask the user for permission
         else if (Notification.permission !== 'denied') {                            //3
           Notification.requestPermission(function (permission) {                    
                 // If the user accepts, let's create a notification
             if (permission === "granted") {                                         //4
               console.log("Permission to receive notifications has been granted");
               getKeys();                                                       
             } 
           });
        }
   }

     function getKeys(){
       navigator.serviceWorker.register('/serviceworker.js', {scope: './'})          //5
         .then(function(registration) {
           return registration.pushManager.getSubscription()
             .then(function(subscription) {
               if (subscription) {
                 return subscription;
               }
               return registration.pushManager.subscribe({                           //6
                 userVisibleOnly: true,
                 applicationServerKey: vapidPublicKey
               });
             });
         }).then(function(subscription) {
          sendNo(subscription.toJSON())                                           //7
         });
     }

   function sendNo(subscription){
	$.post('/sendNo', {
    	subscription: subscription,
        message: 'You clicked a button!'
     });
  }