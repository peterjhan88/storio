import React, { useState } from 'react';
import { withRouter } from 'react-router-dom';

const Search = props => {
  const [city, setCity] = useState('');
  const [state, setState] = useState('');
  const [cityError, setCityError] = useState('');
  const [stateError, setStateError] = useState('');

  const handleCityChange = e => {
    setCity(e.target.value);
  };

  const handleStateChange = e => {
    setState(e.target.value);
  };

  const formatCity = cityName => {
    cityName = cityName.toLowerCase();
    const cityNameArr = cityName.split('');
    for (let i = 0; i < cityNameArr.length; i++) {
      if (i === 0 || cityNameArr[i - 1] === ' ') {
        cityNameArr[i] = cityNameArr[i].toUpperCase();
      }
    }
    const result = cityNameArr.join('');
    return result;
  };

  const handleSubmit = e => {
    e.preventDefault();
    if (!city && !state) {
      setCityError('City required');
      setStateError('State required');
    } else if (!city) {
      setCityError('City required');
      setStateError('');
    } else if (!state) {
      setCityError('');
      setStateError('State required');
    } else {
      props.history.push(`/explore-list/${formatCity(city)}/${state.toUpperCase()}`);
      setCity('');
      setState('');
      setCityError('');
      setStateError('');
    }
  };

  return (
    <div className={`container ${props.extraClass ? props.extraClass : ''}`}>
      <form className="row m-2 d-flex align-items-center" onSubmit={handleSubmit}>
        <div className="col-6 form-group pl-1 m-0">
          <label className="sr-only">City</label>
          <input className="form-control" onChange={handleCityChange} type="text" value={city} placeholder="City Name" />
          <small className="validation-error-message">{cityError}</small>
        </div>
        <div className="col-4 form-group p-0 m-0">
          <label className="sr-only">State</label>
          <input className="form-control" onChange={handleStateChange} type="text" placeholder="State" maxLength="2" value={state} />
          <small className="validation-error-message">{stateError}</small>
        </div>
        <div className="col-2 form-group m-0">
          <button className="btn btn-outline-light"><i className="fas fa-search" /></button>
        </div>
      </form>
    </div>
  );
};

export default withRouter(Search);
