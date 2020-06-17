$(function(){
  function buildHTML(comment){
    var html = `<div class = "comment">
                  <div class = "comment__name">
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>:
                  </div>
                  <div class = "comment__text">${comment.text}</div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.comment__text-box').val('');
      $('.btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})