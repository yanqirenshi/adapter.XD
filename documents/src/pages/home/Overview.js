import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

const tree = [
    ' zip/',
    '  |',
    '  +-- artwork',
    '  |     |',
    '  |     +--- artboard-:id/',
    '  |     |       |',
    '  |     |       `--- graphics/',
    '  |     |               |',
    '  |     |               `--- graphicContent.agc (json)',
    '  |     |',
    '  |     `--- pasteboard/',
    '  |             |',
    '  |             `--- graphics/',
    '  |                     |',
    '  |                     `--- graphicContent.agc (json)',
    '  |',
    '  +-- interactions/',
    '  |     |',
    '  |     `--- interactions.json',
    '  |',
    '  +-- META-INF/',
    '  |     |',
    '  |     `--- metadata.xml',
    '  |',
    '  +-- renditions/',
    '  |     |',
    '  |     `--- image-:?.png',
    '  |',
    '  +-- resources/',
    '  |     |',
    '  |     +--- graphics/',
    '  |     |      |',
    '  |     |      `--- graphicContent.agc (json)',
    '  |     |',
    '  |     `--- :? 画像ファイル。拡張子なし。',
    '  |',
    '  +-- sharing/',
    '  |     |',
    '  |     `--- sharing.json',
    '  |',
    '  +-- manifest (json)',
    '  |',
    '  +-- mimetype (text)',
    '  |',
    '  +-- preview.png',
    '  |',
    '  `-- thumbnail.png'
];


export default function Overview () {
    const prestyle = {
        fontSize:14,
        lineHeight: '14px',
    };

    return (
        <Sections>
          <Section title="XD ファイルの内訳">
            <Contents>
              <p><pre style={prestyle}>{tree.join('\n')}</pre></p>
            </Contents>
          </Section>
        </Sections>
    );
}
