import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

const tree = [
'\'(:|artboards| :HAVE-ID ;; key is :|id|',
'  :|resources| (:|meta| (:|ux| (:|colorSwatches| :not-have-id',
'                                :|documentLibrary| (:|version| :number',
'                                                    :|isStickerSheet| :boolean',
'                                                    :|hashedMetadata| nil',
'                                                    :|elements| (:HAVE-ID :|assetGroupData|))',
'                                :|gridDefaults| (:|defaultGrid| :not-have-id',
'                                                 :|layoutOverrides| :not-have-id)',
'                                :|symbols| (:HAVE-ID :|group|)',
'                                :|symbolsMetadata| (:|haveNestedSymbolsBeenMigrated| :boolean',
'                                                    :|usingNestedSymbolSyncing| :boolean)))',
'                :|gradients| nil',
'                :|clipPaths| nil)',
'  :|children| nil',
'  :|version| :string)',
];


export default function Resources () {
    const prestyle = {
        fontSize:14,
        lineHeight: '14px',
    };

    return (
        <Sections>
          <Section title="resources/graphics/graphicContent.agc">
            <Contents>
              <p><pre style={prestyle}>{tree.join('\n')}</pre></p>
            </Contents>
          </Section>
        </Sections>
    );
}
