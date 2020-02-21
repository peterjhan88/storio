import React, { useContext } from 'react';
import { withRouter } from 'react-router-dom';
import Search from './Search';
import LogInPage from './LogInPage';

import { UserContext } from './UserContext';

const LandingPage = props => {
  const [currentUser] = useContext(UserContext);
  return (
    <React.Fragment>
      <div className="container-fluid landing">
        <img className="storio-logo" src="./images/storio_logo.jpg" />
        <h1 className="storio-heading">storio</h1>
        <p>Find a place to storio stuff:</p>
        <Search listingSearch={props.listingSearch} />
        <h3 className='mt-3'>Extra storage space?</h3>
        <button className="btn btn-large btn-outline-light list-it-button" onClick={() => props.history.push('/host-new-listing')}><h4>List It!</h4></button>
        <LogInPage user={currentUser} tryLogIn={props.tryLogIn} signOut={props.signOut}/>
      </div>
    </React.Fragment>
  );
};

export default withRouter(LandingPage);
