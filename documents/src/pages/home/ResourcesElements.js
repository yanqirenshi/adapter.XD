import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

const tree = [
    '(resouces-data-elements)',
    '',
    '\'((:|id| "a219513e-6c90-41d4-b289-f0110210f705"',
    '   :|name| ""',
    '   :|type| "application/vnd.adobe.element.characterstyle+dcx"',
    '   :|assetGroupData| (:|groupCharacterStyles| "b")',
    '   :|updateElement| 0',
    '   :|representations| ((:|id| "fe659f78-05c4-4c9e-8547-37f96172c3f4"',
    '                        :|type| "application/vnd.adobe.characterstyle+json"',
    '                        :|content| (:|postscriptName| "KozGoPro-Bold"',
    '                                    :|textScript| "none"',
    '                                    :|textTransform| "none"',
    '                                    :|strikethrough| NIL',
    '                                    :|underline| NIL',
    '                                    :|linkId| ""',
    '                                    :|lineSpacing| 0',
    '                                    :|charSpacing| 0',
    '                                    :|fontColor| (:|value| (:|b| 0 :|g| 0 :|r| 0) :|mode| "RGB")',
    '                                    :|fontSize| 11',
    '                                    :|fontStyle| "B"',
    '                                    :|fontFamily| "Kozuka Gothic Pro")',
    '                        :|relationship| "primary"))',
    '   :|index| 111',
    '   :|displayName| NIL',
    '   :|modified| 1603287721934',
    '   :|created| 1600991698863)',
    '',
    '  (:|id| "231f174c-26b0-4b77-919c-5bf9ea33a44e"',
    '   :|name| ""',
    '   :|type| "application/vnd.adobe.element.color+dcx"',
    '   :|assetGroupData| (:|groupColors| "h")',
    '   :|updateElement| 0',
    '   :|representations| ((:|id| "22074a55-0d3d-4e67-8d3b-f13c202a28d7"',
    '                        :|type| "application/vnd.adobe.xdcolor+json"',
    '                        :|content| (:|value| (:|b| 255 :|g| 255 :|r| 255) :|mode| "RGB")',
    '                        :|relationship| "primary"))',
    '   :|index| 112',
    '   :|displayName| NIL',
    '   :|modified| 1604384732180',
    '   :|created| 1604384732179)',
    '',
    '  (:|id| "c7d2f850-e5bd-4dc5-855d-1eec1a56d6b9"',
    '   :|name| ""',
    '   :|type| "application/vnd.adobe.element.color+dcx"',
    '   :|assetGroupData| (:|groupColors| "e")',
    '   :|updateElement| 0',
    '   :|representations|((:|id| "68947705-4427-4720-9625-70ecf89effae"',
    '                       :|type| "application/vnd.adobe.xdcolor+json"',
    '                       :|content| (:|value| (:|b| 15 :|g| 83 :|r| 221) :|mode| "RGB")',
    '                       :|relationship| "primary"))',
    '   :|index| 113',
    '   :|displayName| NIL',
    '   :|modified| 1604384817160',
    '   :|created| 1604384732180))',
];

export default function ResourcesElements () {
    const prestyle = {
        fontSize:14,
        lineHeight: '14px',
    };

    return (
        <Section title=":|elements|" level={4}>
          <Contents>
            <p><pre style={prestyle}>{tree.join('\n')}</pre></p>
          </Contents>
        </Section>
    );
}
