import React, { useState, useEffect, useContext } from 'react';
import { withRouter, Link } from 'react-router-dom';

import { UserContext } from './UserContext';

const Conversations = props => {
  const [correspondents, setCorrespondents] = useState([]);

  const [currentUser] = useContext(UserContext);

  useEffect(() => {
    fetch(`/api/conversations/signedInUserId/${currentUser.userId}`)
      .then(response => response.json())
      .then(jsonData => setCorrespondents(jsonData))
      .catch(err => console.error(err));
  }, []);

  const others = correspondents.map(otherPerson => {
    return (
      <Link key={otherPerson.userId} to={`/message/${currentUser.userId}/${otherPerson.userId}`}>
        <div className='col-10 mx-auto my-1 conversation-list-single-user'>
          <div className='conversation-list-profile-picture-container'>
            <img
              src={otherPerson.profilePicturePath}
              alt={`Picture of userId=${otherPerson.userId} should be here`}
              className='conversation-list-profile-picture'
            />
          </div>
          <div className='conversation-list-profile-name'>{`${otherPerson.firstName} ${otherPerson.lastName}`}</div>
        </div>
      </Link>
    );
  });
  return (
    <>
      <p className="text-muted" onClick={() => props.history.goBack()}>&lt; Back</p>
      <div className="d-flex flex-column conv">{others.length === 0 ? <h3>No conversations to list</h3> : others}</div>
    </>
  );
};

export default withRouter(Conversations);
