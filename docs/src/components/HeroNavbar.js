import React from 'react';

function HeroNavbar () {
    return (
        <nav className="navbar">
          <div className="container">
            <div className="navbar-brand">
              {/* <a className="navbar-item"> */}
              {/*   <img src="https://bulma.io/images/bulma-type-white.png" alt="Logo" /> */}
              {/* </a> */}
              {/* <span className="navbar-burger" data-target="navbarMenuHeroA"> */}
              {/*   <span>x</span> */}
              {/*   <span>x</span> */}
              {/*   <span>x</span> */}
              {/* </span> */}
            </div>
            <div id="navbarMenuHeroA" className="navbar-menu">
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
                {/* <span className="navbar-item"> */}
                {/*   <a className="button is-primary is-inverted"> */}
                {/*     <span className="icon"> */}
                {/*       <i className="fab fa-github"></i> */}
                {/*     </span> */}
                {/*     <span>Download</span> */}
                {/*   </a> */}
                {/* </span> */}
              </div>
            </div>
          </div>
        </nav>
    );
}

export default HeroNavbar;
