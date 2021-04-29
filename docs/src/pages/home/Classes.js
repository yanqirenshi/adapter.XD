import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

import Wbs from './Wbs.js';

const class_graph = [
].join('\n');

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

export default function Classes (props) {
    return (
        <Sections>
          <Section title="クラス図">
            <Contents>
              <pre style={{fontSize: 14, lineHeight: '14px'}}>{class_graph}</pre>
            </Contents>

            <Wbs wbs={props.wbs}
                 columns={columns}
                 start_id={101} />
          </Section>
        </Sections>
    );
}
