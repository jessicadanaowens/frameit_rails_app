// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

$(document).ready(function() {

  //hide and show picture form and wall form

  forms();


  var menu = $('#navigation-menu');
  var menuToggle = $('#js-mobile-menu');
  var signUp = $('.sign-up');

  $(menuToggle).on('click', function(e) {
    e.preventDefault();
    menu.slideToggle(function(){
      if(menu.is(':hidden')) {
        menu.removeAttr('style');
      }
    });
  });


  // underline under the active nav item
  $(".nav .nav-link").click(function() {
    $(".nav .nav-link").each(function() {
      $(this).removeClass("active-nav-item");
    });
    $(this).addClass("active-nav-item");
    $(".nav .more").removeClass("active-nav-item");
  });

  //accordion
  $('.accordion-tabs').each(function(index) {
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
  });

  $('.accordion-tabs').on('click', 'li > a', function(event) {
    if (!$(this).hasClass('is-active')) {
      event.preventDefault();
      var accordionTabs = $(this).closest('.accordion-tabs')
      accordionTabs.find('.is-open').removeClass('is-open').hide();

      $(this).next().toggleClass('is-open').toggle();
      accordionTabs.find('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      event.preventDefault();
    }
  });

//  alert messages
  $(function () {
    var alert = $('.alert');
    if (alert.length > 0) {
      alert.show().animate({height: alert.outerHeight()}, 200);
      window.setTimeout(function() {
        alert.slideUp();
      }, 3000);
    }
  });

//  frame-it canvas
//  var frameIt = function() {
//    var frameItCanvas = document.getElementById("frame-it-canvas");
//    var frameItContext = frameItCanvas.getContext("2d");
//    frameItContext.fillStyle = "rgb(0,0,0)";
//    frameItContext.fillRect(10, 10, 400, 300);
//
//    $('.frame').load(function (evt) {
//      frameItContext.drawImage(evt.currentTarget, 10, 10);
//    });
//  };
//
//  frameIt();

});
