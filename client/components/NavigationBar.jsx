import React, { useContext, useState } from 'react';
import { Link, withRouter } from 'react-router-dom';

import Search from './Search';

import { UserContext } from './UserContext';

const ListingDetail = props => {
  const [searchIconClicked, setSearchIconClicked] = useState(false);

  const [currentUser] = useContext(UserContext);

  const handleSearchIconClick = () => {
    setSearchIconClicked(!searchIconClicked);
  };

  return (
    <>
      <Search extraClass={
        !searchIconClicked
          ? ' hide-navigation-search col-12'
          : ' show-navigation-search col-12'
      }/>
      <div className="navigation-bar">
        <div onClick={handleSearchIconClick} ><i className="fas fa-search" /></div>
        <div onClick={() => {
          currentUser === 'guest'
            ? props.history.push('/')
            : props.history.push('/host-listings/');
        }}
        >
          <i className="fas fa-list-alt navigation-bar-font-color"></i>
        </div>
        <div className='navigation-bar-user-profile' >
          {
            currentUser !== 'guest'
              ? <img
                src={currentUser.profilePicturePath}
                alt={`${currentUser.firstName} ${currentUser.lastName} picture should be here`}
                className='navigation-bar-user-profile-picture navigation-bar-font-color'
              />
              : <i className="fas fa-user navigation-bar-user-icon"></i>
          }
        </div>
        <div
          onClick={() => {
            currentUser === 'guest'
              ? props.history.push('/')
              : props.history.push(`/conversations/${currentUser.userId}`);
          }}
        >
          <i className="fas fa-comment-alt navigation-bar-font-color"></i></div>
        <Link to={'/'}>
          <div><i className="fas fa-warehouse navigation-bar-font-color"></i></div>
        </Link>
      </div>
    </>
  );
};

export default withRouter(ListingDetail);
