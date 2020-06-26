$(function(){

  function buildHTML(message){
    var html = `<div class = "message">
                  <div class= "user-info" >
                    <div class= "user-info__name">
                      ${message.user_name}
                    </div>
                    <div class= "user-info__time">
                      ${message.created_at}
                    </div>
                  </div>
                  <div class = "message__text">
                    ${message.message}
                  </div>
                </div>`
            return html;
}

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData:false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main-chat__messages').append(html);
      $('.main-chat__messages').animate({ scrollTop: $('.main-chat__messages')[0].scrollHeight});
      $('form')[0].reset();
    })
    


  });
});