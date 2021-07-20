App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    //ユーザーが送信した場合
    if (data["sender"]=="user"){
      message=`<div class='mycomment'><div class='faceicon'>
      <img src='' alt='あなた'></div><p>${data["message"]}</p></div>`;
    }
    // 運営が送信した場合
    else{
      message=`<div class='fukidasi'><div class='faceicon'>
      <img src='/assets/profile.png' alt='運営'></div>
      <div class='chatting'><div class='says'><p>${data["message"]}</p>
      </div></div></div>`;
    }
    $('#chats').append(message);
    $('#chats').animate({scrollTop: $('#chats')[0].scrollHeight}, 'fast');
  },
  speak: function(message) {
    user_ip=$("#user_ip").val();
    admin_id=$("#admin_id").val();
    spot_id=$("#spot_id").val();
    sender=$("#sender").val();
    return this.perform('speak',{message: message, user_ip: user_ip, admin_id: admin_id, spot_id: spot_id, sender: sender});
  }
});
$(function(){
  $("#send").on("click",function(e){
    message=$("#message").val();
    App.chat.speak(message);
    $("#message").val(""); //フォームを空に
    e.preventDefault();
  });
});