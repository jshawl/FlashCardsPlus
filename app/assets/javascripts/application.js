// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
(function() { // awesome IIFE! Though, unencessary here because of document.ready()
  var cards = document.querySelectorAll(".card.effect__click"); // consider using jQuery since it's already on the page
  for ( var i  = 0, len = cards.length; i < len; i++ ) {
    var card = cards[i];
    clickListener( card );
  }

  // jQuery:
  // $(".card.effect__click").on("click", function(){
    // $(this).toggleClass("flipped")
  // })

  function clickListener(card) {
    card.addEventListener( "click", function() {
      var c = this.classList;
      c.contains("flipped") === true ? c.remove("flipped") : c.add("flipped");
    });
  }
})();

 //This is the js keycode for ENTER

function keypress(e){
  key = e.which;
  if(key == 39){
    $("#rightbutton").click()
  } else if(key == 37) {
    $("#leftbutton").click()
  } else if(key == 32) {
    $("#test").click()
  }
}
// ^^ excellent!

$(document).on('keydown', keypress);
// remember to indent correctly
});
