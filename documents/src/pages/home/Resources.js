import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

import ResourcesElements from './ResourcesElements.js';

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

const x1 = [
    '(resouces-data-symbols)',
    '',
    '\'(:|b69dfab5-5097-4e84-b53f-a3b4c40a9e6d|',
    '  (:|name| "art-board-name"',
    '   :|height| 774',
    '   :|width| 375',
    '   :|viewportHeight| 667',
    '   :|y| 8196',
    '   :|x| -18141))',
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

          <Section title=":|artboards|">
            <Contents>
              <p><pre style={prestyle}>{x1.join('\n')}</pre></p>
            </Contents>
          </Section>

          <Section title=":|resources|">

            <ResourcesElements />

            <Section title=":|symbols|" level={4}>
              <Contents>
                <p>SVGっぽい。</p>
              </Contents>
            </Section>
          </Section>

        </Sections>
    );
}
