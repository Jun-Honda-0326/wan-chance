$(function(){
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    const formData = new FormData(this);
  })
})