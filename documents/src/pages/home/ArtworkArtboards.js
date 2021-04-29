import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

const tree = [
    '(artwork-artboard-data "33d0e899-7255-4554-b08e-46818ff65507")',
    '',
    '\'(:|version| :string',
    '  :|children| ((:|artboard| (:|type| :string ;; "artboard"',
    '                             :|id| :string',
    '                             :|meta| (:|ux| (:|hasCustomName| :boolean',
    '                                             :|constraintsDisabled| :boolean',
    '                                             :|gridStyle| :not-have-id))',
    '                             :|style| :not-have-id',
    '                             :|artboard| (:|children| :HAVE-ID',
    '                                          :|meta| (:|ux| (:|path| :string)) ;; is :|id| ex) "33d0e899-7255-4554-b08e-46818ff65507"',
    '                                          :|ref| :string)))) ;; is :|id| ex) "33d0e899-7255-4554-b08e-46818ff65507"',
    '  :|resources| (:|href| :string)  ;; "/resources/graphics/graphicContent.agc"',
    '  :|artboards| (:|href| :string)) ;; "/resources/graphics/graphicContent.agc"',
];


export default function ArtworkArtboards () {
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
