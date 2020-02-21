import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/app';
import { UserProvider } from './components/UserContext';

ReactDOM.render(
  <UserProvider>
    <App />
  </UserProvider>,
  document.querySelector('#root')
);
