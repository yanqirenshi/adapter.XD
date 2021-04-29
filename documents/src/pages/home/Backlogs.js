import React from 'react';

import * as SOGH from '@yanqirenshi/sogh';

import {
    Sections, Section, Contents,
} from '../../components/Common.js';

export default function Backlogs (props) {
    if (!props.repo) return null;

    const sogh = props.sogh;
    const repo = {
        owner: props.repo.owner.login,
        name:  props.repo.name,
    };

    return (
        <div style={{paddingBottom:222}}>

          <Sections>
            <Section w={1222}>
              <Contents>
                <SOGH.ProductBacklogs sogh={sogh}
                                      repository={repo}
                                      productbacklog_url_prefix="/backlogs/" />
              </Contents>
            </Section>
          </Sections>
        </div>
    );
}
