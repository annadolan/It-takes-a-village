$(document).ready(function() {
  $('.first').on('change', function(){
    $('.second').addClass('show');
  });

  $('.second').on('change', function(){
    $('.third').addClass('show');
  });

  $('.third').on('change', function(){
    $('.last').addClass('show');
  });
});
