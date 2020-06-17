$(function(){
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    const formData = new FormData(this);
    const url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: 'formdata',
      dataType: 'json',
      processData: false,
      contentType: false
    })
  })
})