import React, { useContext, useState, useEffect } from 'react';
import { withRouter } from 'react-router-dom';

import { UserContext } from './UserContext';

const Message = props => {
  const [messages, setMessages] = useState([]);
  const [messageToSend, setMessageToSend] = useState('');
  const [currentUser] = useContext(UserContext);

  const handleSubmit = event => {
    event.preventDefault();
    const messageObject = { message: messageToSend };
    if (!messageObject.message) {
      // eslint-disable-next-line no-console
      console.log('Cannot send empty string');
      return;
    }
    const currentUserId = currentUser.userId;
    const hostId = parseInt(props.match.params.hostId, 10);
    if (currentUserId === hostId) {
      // eslint-disable-next-line no-console
      console.log('Cannot send message to yourself!!');
      return;
    }
    messageObject.signedInUserId = currentUserId;
    messageObject.correspondentUserId = hostId;
    const headersToSend = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(messageObject)
    };
    fetch('/api/messages/', headersToSend)
      .then(result => result.json())
      .then(jsonData => {
        setMessages(previousMessages => {
          var newMessages = previousMessages.messages;
          newMessages.push(jsonData);
          return newMessages;
        });
        setMessageToSend('');
      })
      .catch(err => console.error(err));
  };

  const handleChange = event => {
    const userInput = event.target.value;
    setMessageToSend(userInput);
  };

  const getMessages = () => {
    fetch(`/api/messages/${currentUser.userId}/${props.match.params.hostId}`)
      .then(result => result.json())
      .then(jsonData => {
        setMessages(jsonData);
      })
      .catch(err => console.error(err));
  };

  useEffect(() => {
    getMessages();
  }, []);

  const allMessages = messages.length === 0
    ? (
      <div className="message-container">
        <div className="col-12 mt-2">
          <i
            className="far fa-arrow-alt-circle-left col-12 back-arrow pl-0 ml-0 mb-2"
            onClick={() => {
              props.history.goBack();
            }}
          ></i>
        </div>
        <div>No messages to display</div>
        <div onClick={getMessages} className='sync-button'>
          <i className="fas fa-sync my-3 sync-button-icon"></i>
        </div>
      </div>
    )
    : messages.map(messageObject => {
      return (
        <SingleMessage
          message={messageObject.message}
          key={messageObject.messageId}
          fromId={messageObject.fromId}
          loggedInUserId={currentUser.userId}/>
      );
    });

  return (
    <>
      {!allMessages ? (
        allMessages
      ) : (
        <>
          <div className="col-12 mt-2">
            <i
              className="far fa-arrow-alt-circle-left col-12 back-arrow pl-0 ml-0 mb-2"
              onClick={() => {
                props.history.goBack();
              }}
            ></i>
          </div>
          <div className="message-container">{allMessages}</div>
          <div onClick={getMessages} className="sync-button">
            <i className="fas fa-sync my-3 sync-button-icon cursor-pointer"></i>
          </div>
        </>
      )}
      <form onSubmit={handleSubmit} className="col-12 message-form">
        <input
          type="text"
          placeholder="Type message here"
          value={messageToSend}
          onChange={handleChange}
          className="col-10 mx-2 mt-2 message-input"
          cols="32"
        />
        <div onClick={handleSubmit}>
          <i className="mt-2 fas fa-arrow-alt-circle-right send-message-button"></i>
        </div>
      </form>
    </>
  );
};

const SingleMessage = props => {
  const messageClassToApply = props.fromId === props.loggedInUserId
    ? ' message-by-logged-in-user'
    : ' message-by-other';
  const messageTail = props.fromId === props.loggedInUserId
    ? ' right-arrow'
    : ' left-arrow';
  return (
    <div className={`col-12${messageClassToApply}`}>
      <div className='message p-3 my-2'>{props.message}</div>
      <div className={messageTail}></div>
    </div>
  );
};

export default withRouter(Message);
