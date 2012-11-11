$(function(){
  var form = $('#subscribe-form');
  if(form.length) {
    form.change(updateRssLink)
  }
})

function updateRssLink() {
  $('#email').attr('disabled', 'disabled')
  $('#rss-path').attr('value', 'http://www.seaoo.ca/rss?'+$('#subscribe-form').serialize())
  $('#email').attr('disabled', false)
}