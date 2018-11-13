App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data){
    const messages = document.getElementById('messages')
    return messages.insertAdjacentHTML("beforeEnd", this.renderMessage(data));
    },
    renderMessage: function(data){
        console.log(data)
     return `<p> <b>${data.user.username} : <br> ${data.message} </p>`;
    }
});