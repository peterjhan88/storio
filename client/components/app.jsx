import React, { useContext, useEffect } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Conversations from './Conversations';
import ExploreList from './ExploreList';
import ExploreMap from './ExploreMap';
import HostListings from './HostListings';
import LandingPage from './LandingPage';
import ListingDetail from './ListingDetail';
import Message from './Message';
import HostNewListing from './HostNewListing';
import NavigationBar from './NavigationBar';

import { UserContext } from './UserContext';

const App = props => {

  const [currentUser, setCurrentUser] = useContext(UserContext);

  useEffect(() => {
    // eslint-disable-next-line no-console
    console.log('something chnaged in the components');
  });

  const tryLogIn = email => {
    if (email === '') {
      return;
    }
    fetch(`/api/users/${email}`)
      .then(response => response.json())
      .then(jsonData => {
        if (jsonData === 'DNE') {
          return;
        }
        setCurrentUser(prevUser => {
          return jsonData;
        });
      })
      .catch(err => console.error(err));
  };

  const signOut = () => {
    setCurrentUser('guest');
  };

  return (
    <Router>
      <Route exact={true} path='/'>
        <LandingPage tryLogIn={tryLogIn} user={currentUser} signOut={signOut} />
      </Route>
      <Route exact={true} path='/conversations/:loggedInUserId'>
        <Conversations />
        <NavigationBar user={currentUser}/>
      </Route>
      <Route exact={true} path='/explore-list/:city/:state'>
        <ExploreList user={currentUser} />
        <NavigationBar user={currentUser} />
      </Route>
      <Route exact={true} path='/explore-map/:city/:state'>
        <ExploreMap user={currentUser} />
        <NavigationBar user={currentUser} />
      </Route>
      <Route exact={true} path='/host-listings'>
        <HostListings user={currentUser} />
        <NavigationBar user={currentUser} />
      </Route>
      <Route exact={true} path='/listing-detail/:storageId'>
        <ListingDetail user={currentUser} />
        <NavigationBar user={currentUser} />
      </Route>
      <Route exact={true} path='/message/:loggedInUserId/:hostId' >
        <Message user={currentUser}/>
        <NavigationBar user={currentUser} />
      </Route>
      <Route exact={true} path='/host-new-listing'>
        <HostNewListing user={currentUser} />
        <NavigationBar user={currentUser} />
      </Route>
    </Router>
  );
};

export default App;
