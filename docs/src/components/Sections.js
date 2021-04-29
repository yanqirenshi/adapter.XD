import React from 'react';

import * as Bulma from 'react-bulma-components';

export default function Sections (props) {
    const style = {
        display: 'flex',
        flexWrap: 'wrap',
        justifyContent: 'center'
    };

    return (
          <div style={style}>
            {props.children}
          </div>
    );
}
