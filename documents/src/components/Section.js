import React from 'react';

import * as Bulma from 'react-bulma-components';

export default function Section (props) {
    const title = props.title;
    const subtitle = props.subtitle;
    const children = props.children;
    const style = {
        ...props.style,
        ...{ minWidth: props.w || 888, maxWidth: props.w || 888 },
    };

    return (
        <Bulma.Section style={style}>
          <Bulma.Container>

            {title &&
             <Bulma.Heading>
               {title}
             </Bulma.Heading>}

            {subtitle &&
              <Bulma.Heading subtitle>
                {subtitle}
              </Bulma.Heading>}

            {children}

          </Bulma.Container>
        </Bulma.Section>
    );
}
