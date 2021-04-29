import React from 'react';

import * as Bulma from 'react-bulma-components';

export default function Contents (props) {
    const children = props.children;
    const style = props.style;

    return (
        <Bulma.Content style={style}>
          {children}
        </Bulma.Content>
    );
}
