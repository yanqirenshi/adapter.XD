import React from 'react';
import { Link } from 'react-router-dom';

function HeroTabs (props) {
    const search = new URLSearchParams(props.location.search);

    const tabs = props.source;

    const active_code = search.get('tab') || tabs[0].code || null;

    return (
        <nav className="tabs is-boxed is-centered">
          <div className="container">
            <ul>
              {tabs.map(d => {
                  return <li key={d.code}
                             className={d.code===active_code ? "is-active" : ''}
                             tab_code={d.code}>

                           <Link to={{search: "?tab="+d.code}}>
                             {d.label}
                           </Link>

                         </li>;
              })}
            </ul>
          </div>
        </nav>
    );
}

export default HeroTabs;
