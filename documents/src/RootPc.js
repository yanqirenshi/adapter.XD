import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Home from './pages/Home.js';
import Backlog from './pages/Backlog.js';

function Root (props) {
    return (
        <>
          <Router>
            <Route exact path='/'
                   render={()=><Home sogh={props.sogh} repo={props.repo}/>}/>
            <Route exact path='/backlogs/:backlog_id'
                   render={()=><Backlog sogh={props.sogh} repo={props.repo}/>}/>
          </Router>
        </>
    );
}

export default Root;
