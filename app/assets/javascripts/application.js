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
//= require activestorage
//= require turbolinks
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require_tree .


$(document).delegate('.hacker-news-link', 'click', function(e) {
  e.preventDefault();
  var self = this;
  $.get('/hacker_new/show', {
    title: $(self).attr('data-title'),
    image: $(self).attr('data-image'),
    link: $(self).attr('href')
  }, function(data, status){
    if (data.state === 'done') {
      var renderNews;
      if (window.innerWidth <= 768) {
        renderNews = $(self).parents('.news-row').find('.single-news');
        renderNews.toggle();
      } else {
        renderNews = $('.wrapper .single-news');
      }
      renderNews.html(data.body);

      var img = $(self).parents('.news-row').find('.image');
      var excerpt = $(self).parents('.news-row').find('.excerpt');

      console.log(data.image);
      if (data.image !== null) {
        img.removeClass('hidden');
        img.css('background-image', 'url(' + data.image + ')')
      }
      excerpt.html(data.excerpt);
    } else {
      $('.toast').toast('show')
    }
  })
});
