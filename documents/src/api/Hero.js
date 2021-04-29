import React, {useState} from 'react';

import HeroTabs from './HeroTabs.js';

export default function Hero (props) {
    const [tabs] = useState([
        { code: 'overview',       label: 'Overview' },
        { code: 'wbs',            label: 'Wbs' },
    ]);

    return (
        <section className="hero is-primary is-medium"
                 style={{backgroundColor: 'rgba(199,178,131)'}}>
          <div className="hero-head">
            <header className="navbar">
              <div className="container">
                <div className="navbar-brand">
                  {/* <a className="navbar-item"> */}
                  {/*   <img src="https://bulma.io/images/bulma-type-white.png" alt="Logo" /> */}
                  {/* </a> */}
                </div>
                <div id="navbarMenuHeroC" className="navbar-menu">
                  <div className="navbar-end">
                    {/* <a className="navbar-item is-active"> */}
                    {/*   Home */}
                    {/* </a> */}
                    {/* <a className="navbar-item"> */}
                    {/*   Examples */}
                    {/* </a> */}
                    {/* <a className="navbar-item"> */}
                    {/*   Documentation */}
                    {/* </a> */}
                  </div>
                </div>
              </div>
            </header>
          </div>

          <div className="hero-body" style={{padding: '4rem 1.5rem'}}>
            <div className="container has-text-centered">
              <p className="title">
                {props.label}
              </p>
              <p className="subtitle">
                Subtitle
              </p>
            </div>
          </div>

          <div className="hero-foot">
            <HeroTabs source={tabs} location={props.location} />
          </div>
        </section>
    );
}
