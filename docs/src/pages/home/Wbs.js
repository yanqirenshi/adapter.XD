import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

import WBSTable from '@yanqirenshi/table.wbs';

export default function Wbs (props) {
    const columns = [
        {
            label: 'Code',
            required: true,
            contents: (c, d) => {
                return <>{d._id}</>;
            }
        },
        {
            label: 'Name',
            leveling: true,
            required: true,
            contents: (c, d) => {
                return <>
               <span>{d.label}</span>
             </>;
            },
        },
        {
            label: 'Description',
            contents: (c, d) => {
                return d.description;
            }
        },
    ];

    const wbs_source = {
        projects:     props.wbs.PROJECTS,
        wbs:          props.wbs.WBS,
        workpackages: props.wbs.WORKPACKAGES,
        edges:        props.wbs.EDGES,
    };

    const options = {}; // or null
    const style_table = { fontSize: '16px' }; // or null

    return (
        <Sections>
          <Section>
            <Contents>
              <WBSTable source={props.wbs || wbs_source}
                        columns={props.columns || columns}
                        options={props.options || options}
                        style={props.style || style_table}
                        start_id={props.start_id} />
            </Contents>
          </Section>
        </Sections>
    );
}
