$(function(){
  var form = $('#subscribe-form');
  if(form.length) {
    form.change(updateRssLink)
  }

  $('#add-category').click(function (e){
    e.preventDefault()
    $('article.rule').clone().appendTo($('#filter-rules'));
  });
})

function updateRssLink() {
  $('#email').attr('disabled', 'disabled')
  $('#rss-path').attr('value', 'http://www.seaoo.ca/rss?'+$('#subscribe-form').serialize())
  $('#email').attr('disabled', false)
}