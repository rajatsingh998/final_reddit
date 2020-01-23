'use strict';

var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');
var postId=document.querySelector('#curPost');

var stompClient = null;
var username = null;
window.onload = function() {
    connect(true);
};
function connect(event) {
    username = document.querySelector('#name').value.trim();

    if(username) {
        usernamePage.classList.add('hidden');
        chatPage.classList.remove('hidden');

        var socket = new SockJS('/javatechie');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    }
    event.preventDefault();
}


function onConnected() {
    // Subscribe to the Public Topic
    stompClient.subscribe('/topic/public', onMessageReceived);

    // Tell your username to the server
    stompClient.send("/app/chat.register",
        {},
        JSON.stringify({sender: username, type: 'JOIN'})
    )

    connectingElement.classList.add('hidden');
}


function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}


function send(event) {
    // if(username==='anonymousUser')
    // {
    //     console.log("asdncanscalknclak");
    //     document.getElementById("msg").innerText="Plz log in to comment";
    //     return;
    // }
    var messageContent = messageInput.value.trim();

    if(messageContent && stompClient) {
        var chatMessage = {
            sender: username,
            content: messageInput.value,
            type: 'CHAT',
            id: postId.value
        };
if(chatMessage.sender!=='anonymousUser')
        stompClient.send("/app/chat.send", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}


function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);
    var date=new Date();
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thu', 'Friday', 'Saturday'];
    var mon=['Jan','Feb','March','April','May','June','July','Aug','Sep','Oct','Nov','Dec'];

    var messageElement = document.createElement('p');
    //
    // if(message.type === 'JOIN') {
    //     messageElement.classList.add('event-message');
    //     message.content = message.sender + ' joined!';
    // } else if (message.type === 'LEAVE') {
    //     messageElement.classList.add('event-message');
    //     message.content = message.sender + ' left!';
    // } else {
    messageElement.classList.add('chat-message');
    // var avatarElement = document.createElement('i');
    // var avatarText = document.createTextNode(message.sender[0]);
    // avatarElement.appendChild(avatarText);
    // avatarElement.style['background-color'] = getAvatarColor(message.sender);
    // messageElement.appendChild(avatarElement);
    var usernameElement = document.createElement('span');
    // span.className="spanTag";
    usernameElement.style.color="black";
    var brk=document.createElement('br');
    var hr=document.createElement('hr');
    var usernameText = document.createTextNode('u/'+message.sender+' Posted on: '+ days[date.getDay()] +' '+ mon[date.getMonth()]+' ' +date.getHours()+':'+date.getMinutes()+ ':'+date.getSeconds() +' IST'+' '+date.getFullYear() );

    usernameElement.appendChild(usernameText);
    messageElement.appendChild(usernameElement);



    var textElement = document.createElement('p');

    textElement.style.fontSize="18px";
    var messageText = document.createTextNode(message.content);

    textElement.appendChild(messageText);


    messageElement.appendChild(textElement);
    messageElement.appendChild(brk);
    messageElement.appendChild(hr);
    if (message.type === 'CHAT') {
        messageArea.appendChild(messageElement);
        // messageArea.scrollTop = messageArea.scrollHeight;
    }
}

messageForm.addEventListener('submit', send, true)