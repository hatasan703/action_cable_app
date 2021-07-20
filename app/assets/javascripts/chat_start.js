$(function() {
  $('#chat_start_button').click(function(){
    $('#chats_window').toggle('slow');
    $('#chats').animate({scrollTop: $('#chats')[0].scrollHeight}, 'fast');
  });
});