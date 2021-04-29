import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

const tree = [
    '(artwork-pasteboard-data)',
    '',
    '\'(:|version| :string',
    '  :|children| :HAVE-ID',
    '  :|resources| (:|href| :string)  ;; "/resources/graphics/graphicContent.agc"',
    '  :|artboards| (:|href| :string)) ;; "/resources/graphics/graphicContent.agc"',
];


export default function Interactions () {
    const prestyle = {
        fontSize:14,
        lineHeight: '14px',
    };

    return (
        <Sections>
          <Section title="artboard-${id}/graphics/graphicContent.agc">
            <Contents>
              <p><pre style={prestyle}>{tree.join('\n')}</pre></p>
            </Contents>
          </Section>
        </Sections>
    );
}
