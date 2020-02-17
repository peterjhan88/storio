import React, { useState, createContext } from 'react';

export const UserContext = createContext();

export const UserProvider = props => {
  // eslint-disable-next-line no-unused-vars
  const [currentUser, setCurrentUser] = useState('guest');
  return (
    <UserContext.Provider value={currentUser}>
      {props.children}
    </UserContext.Provider>
  );
};
