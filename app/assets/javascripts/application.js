// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() {

  //Navegación para el miembro
  var memberNav = false;
  $('#member-navigation').on('click', function(){
    if (memberNav == false) {
      memberNav = true;
      $('#member-options').slideDown(300);
    }
    else {
      memberNav = false;
      $('#member-options').slideUp(300);
    }
  });

  //Inicio de sesión hover
  $('.not-signed-in').hover(
    function(){
      $('.not-member').fadeIn(300)
    },
    function(){
      $('.not-member').fadeOut(300)
    }
  );

  //Volver arriba
  $('#back-top').on('click',function(){
  		$('body, html').animate({
  			scrollTop: '0px'
  		}, 300);
  });

  $(window).scroll(function(){
  	if( $(this).scrollTop() > 0 ){
  		$('#back-top').slideDown(300);
  	} else {
  		$('#back-top').slideUp(300);
  	}
  });

  //Easter egg
  var change = 0;
  $('#hi').on('click', function(){
    change++;
    if (change == 1) {
      $('.logo').fadeOut(0);
      $('.img-1').fadeIn(200);
    } else if (change == 2) {
      $('.logo').fadeOut(0);
      $('.img-2').fadeIn(200);
    } else if (change == 3) {
      $('.logo').fadeOut(0);
      $('.img-3').fadeIn(200);
    }else if (change == 4) {
      $('.logo').fadeOut(0);
      $('.img-4').fadeIn(200);
    } else if (change == 5) {
      $('.logo').fadeOut(0);
      $('.img-5').fadeIn(200);
      change = 0;
    }
  });

});
