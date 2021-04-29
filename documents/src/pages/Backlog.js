import React from 'react';
import {useParams} from "react-router-dom";

import * as SOGH from '@yanqirenshi/sogh';

export default function Backlog (props) {
    let {backlog_id} = useParams();

    if (!props.repo) return null;

    const sogh = props.sogh;
    const repo = {
        owner: props.repo.owner.login,
        name:  props.repo.name,
    };

    return (
        <div style={{paddingBottom:222}}>
          <SOGH.ProductBacklog sogh={sogh}
                               repository={repo}
                               project_id={backlog_id}
                               root_url={{to: '/?tab=backlogs', label: 'Product Backlogs'}} />
        </div>
    );
}
