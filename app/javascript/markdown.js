window.copy = function(e) {
  // クリックしたボタンに紐づくコードの範囲の定義
  let code = e.closest('.highlight-wrap').querySelector('.rouge-code')

  // クリップボードにコードをコピーしてから、ボタンのテキストを変更する
  navigator.clipboard.writeText(code.innerText)
    .then(() => e.innerText = 'Copied')

  // 任意：コピーしたコードが選択されたようにする 
  window.getSelection().selectAllChildren(code)
}

window.addEventListener('turbolinks:load', function(){
  let editArea = document.getElementById('article_markdown_content') // テキストエリア
  let previewArea = document.getElementById('preview') // プレビューエリア
  if (!editArea || !previewArea) return // テキストエリアとプレビューエリアがなかったらリターン

  // タイピングが1秒停止したらプレビューする、タイピングし続ける時はプレビューしない。
  editArea.addEventListener('keyup', delay(function() {
    preview()
  }, 1000))

  // POST リクエストして、マークダウンした形のHTMLを取得する
  function preview() {
    let text = editArea.value
    fetch('/api/v1/tweets/preview', {
      headers: { 'Content-Type': 'application/json' },
      method: 'POST',
      body: JSON.stringify({ text })
    })
      .then((response) => response.json())
      .then(data => {
        previewArea.innerHTML = data.content
        console.log('Updated preview')
      })
      .catch(() => console.warn('Error occurred while updating preview'))
  }

  // 遅延ファンクションの定義
  function delay(callback, ms) {
    let timer = 0
    return function() {
      let context = this, args = arguments;
      clearTimeout(timer);
      timer = setTimeout(function () {
        callback.apply(context, args)
      }, ms || 0);
    }
  }
})