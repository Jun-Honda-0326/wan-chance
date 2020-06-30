$(document).on('click', function () {
  $(function () {
    // 画像をプレビュー表示させる.prev-contentを作成
    function buildHTML(image) {
      var html =
        `
        <div class="prev-content">
          <img src="${image}", alt="preview" class="prev-image">
          <div class="remove">変更する</div>
        </div>
        `
      return html;
    }
    $(document).on('change', '.hidden_file', function () {
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var image = this.result;
        if ($('.prev-content').length == 0) {
          var html = buildHTML(image)  
          $('.prev-contents').prepend(html);
        } else {
          $('.prev-content .prev-image').attr({ src: image });
        }
      }
    });

    $(document).on('click', '.remove', function(){
      $('.prev-content').remove();
    });
  });
});