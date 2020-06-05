$(document).on('turbolinks:load', function () {
  $(function () {
    // 画像をプレビュー表示させる.prev-contentを作成
    function buildHTML(image) {
      var html =
        `
        <div class="prev-content">
          <img src="${image}", alt="preview" class="prev-image">
        </div>
        `
      return html;
    }

    // 画像が選択された時に発火します
    $(document).on('change', '.hidden_file', function () {
      console.log("ok");
      // .file_filedからデータを取得して変数fileに代入します
      var file = this.files[0];
      // FileReaderオブジェクトを作成します
      var reader = new FileReader();
      // DataURIScheme文字列を取得します
      reader.readAsDataURL(file);
      // 読み込みが完了したら処理が実行されます
      reader.onload = function () {
        // 読み込んだファイルの内容を取得して変数imageに代入します
        var image = this.result;
        // プレビュー画像がなければ処理を実行します
        if ($('.prev-content').length == 0) {
          // 読み込んだ画像ファイルをbuildHTMLに渡します
          var html = buildHTML(image)
          // 作成した.prev-contentをiconの代わりに表示させます
          $('.prev-contents').prepend(html);
          // 画像が表示されるのでiconを隠します
        } else {
          // もし既に画像がプレビューされていれば画像データのみを入れ替えます
          $('.prev-content .prev-image').attr({ src: image });
        }
      }
    });
  });
});