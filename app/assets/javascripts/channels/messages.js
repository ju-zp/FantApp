App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data){
    const messages = document.getElementById(`messages${data.chatroom_id}`)
    if(messages!=null){
        messages.innerHTML = ''
        return messages.insertAdjacentHTML("beforeEnd", this.renderMessage(data));
    }
    },
    renderMessage: function(data){
        var result = ''
        console.log(data)
        var count = parseInt(data.message.size)
        for(var i=0; i<count; i++)
        {   
            var test = data.message[i]
            result = result + `<div class="post"><p> <b>${test.name} at ${test.time} : <br> ${test.content}</p></div>`
        }
        
        return result;
        }
});