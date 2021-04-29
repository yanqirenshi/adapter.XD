import React from 'react';
import { useLocation, Link } from 'react-router-dom';

function item (d, active_code) {
    return (
        <li key={d.code}
            className={d.code===active_code ? "is-active" : ''}
            tab_code={d.code}>

          <Link to={{search: "?tab="+d.code}}>
            {d.label}
          </Link>

        </li>
    );
}

export default function HeroTabs (props) {
    const tabs = props.source;

    const search = new URLSearchParams(useLocation().search);
    const active_code = search.get('tab') || tabs[0].code || null;

    return (
        <nav className="tabs is-boxed is-centered">
          <div className="container">
            <ul>
              {tabs.map(d => item(d, active_code))}
            </ul>
          </div>
        </nav>
    );
}
