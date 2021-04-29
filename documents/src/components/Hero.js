import React from 'react';

import HeroNavbar from './HeroNavbar.js';
import HeroTabs from './HeroTabs.js';

const style = {
    backgroundColor: 'rgba(157, 91, 139)',
    body: { padding: '4rem 1.5rem' }
};

export default function Hero (props) {
    const breadcrumb = null;
    const title = props.title;
    const subtitle = props.subtitle;
    const tabs = props.tabs;

    return (
        <section className="hero is-primary is-medium" style={style}>
          {breadcrumb &&
           <div className="hero-head">
             <HeroNavbar />
           </div>}

          <div className="hero-body" style={style.body}>
            <div className="container has-text-centered">
              {title &&
               <h1 className="title">
                 {title}
               </h1>}

              {subtitle &&
               <h2 className="subtitle">
                 {subtitle}
               </h2>}
            </div>
          </div>

          {tabs &&
           <div className="hero-foot">
             <HeroTabs source={tabs} />
           </div>}
        </section>
    );
}
