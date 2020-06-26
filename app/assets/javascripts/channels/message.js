$(function(){
  $('#new_message').on('submit', function(e){
    console.log('OK');
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url:url,
      type: 'POST',
      data:FormData,
      processData:false,
      contentType: false
    })
  });

});