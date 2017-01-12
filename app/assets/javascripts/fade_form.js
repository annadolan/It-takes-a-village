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

  $('.fade').addClass('show');

  $('.fade').on('change', function(){
    $('.add-tasks').addClass('show');
  })

  $('.fade-out').on('click', function(){
    $('.fade-out').addClass('hide');
  })
});
