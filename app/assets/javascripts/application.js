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
    var frameIt = function() {
    var can = document.getElementById("can");
    var canContext = can.getContext("2d");

      canContext.fillStyle = 'rgba(255,0,0,.4)';
      canContext.fillRect(20,20,20,80);
      canContext.fillStyle = 'rgba(205,255,23,.4)';
      canContext.fillRect(30,30,40,50);
      canContext.fillStyle = 'rgba(5,255,0,.4)';
      canContext.fillRect(40,50,80,20);

//    $('.frame').load(function (evt) {
//      frameItContext.drawImage(evt.currentTarget, 0, 0, frameItCanvas.width, 30);
//    });

    var canOne = document.getElementById("first-canvas");
    var firstContext = canOne.getContext("2d");

    canContext.drawImage(canOne, 0, 0);


  };



});
