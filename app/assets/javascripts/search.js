$(function(){

  var search_list = $(".contents");

  function appendPost(post){
    var html = `<div class = "content">
                  <div class "img-box">
                    <a href = /posts/${post.id}>
                    <img src= ${post.image} width="600" height="415">
                    </a> </div>
                    <div class = "text-box">
                      <div class = text>
                        <p>${post.text}</p>
                      </div>
                      <div class = user-info>
                        <div class = user-name>
                        投稿者:${post.name}
                       </div>
                       <div class= "post-time">
                         投稿:${post.created_at}
                       </div>
                       </div>
                       </div>`
    search_list.append(html);
  } 
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }
  
  $(".search-input").on("keyup", function(){
    var input = $(".search-input").val();
    $.ajax({
      type: 'get',
      url: '/posts/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(posts){
      search_list.empty();
      $(".contents").empty();
      if (posts.length !== 0){
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else{
        appendErrMsgToHTML("一致する投稿はありません");
      }
    })
  });
});