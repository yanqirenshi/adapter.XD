import React, { useState } from 'react';
import { useLocation } from "react-router-dom";

import Hero from '../components/Hero.js';

import Overview from './home/Overview.js';
import Resources from './home/Resources.js';
import ArtworkArtboards from './home/ArtworkArtboards.js';
import ArtworkPasteboard from './home/ArtworkPasteboard.js';
import Interactions from './home/Interactions.js';
import Backlogs from './home/Backlogs.js';
import Operators from './home/Operators.js';
import Classes from './home/Classes.js';
import Wbs from './home/Wbs.js';

import * as WBS_DATA from '../data/WBS_DATA.js';

const wbs_data = {
    projects:     WBS_DATA.PROJECTS,
    wbs:          WBS_DATA.WBS,
    workpackages: WBS_DATA.WORKPACKAGES,
    edges:        WBS_DATA.EDGES,
};

function Home (props) {
    const [tabs] = useState([
        { code: 'overview',     label: 'Overview' },
        { code: 'resources',    label: 'resources/' },
        { code: 'artboards',    label: 'artwork/artboard-:id/' },
        { code: 'pasteboard',   label: 'artwork/pasteboard/' },
        { code: 'interactions', label: 'interactions/' },
        { code: 'backlogs',     label: 'Backlogs' },
        { code: 'classes',      label: 'Classes' },
        { code: 'operators',    label: 'Operators' },
        { code: 'wbs',          label: 'Wbs' },
    ]);

    const search = new URLSearchParams(useLocation().search);
    const active_code = search.get('tab') || tabs[0].code || null;

    return (
        <>
          <Hero tabs={tabs}
                title="adapter.XD" />

          {'overview'===active_code     && <Overview wbs={wbs_data} />}
          {'resources'===active_code    && <Resources wbs={wbs_data} />}
          {'artboards'===active_code    && <ArtworkArtboards wbs={wbs_data} />}
          {'pasteboard'===active_code   && <ArtworkPasteboard wbs={wbs_data} />}
          {'interactions'===active_code && <Interactions wbs={wbs_data} />}
          {'backlogs'===active_code     && <Backlogs wbs={wbs_data} sogh={props.sogh} repo={props.repo}/>}
          {'classes'===active_code      && <Classes wbs={wbs_data} />}
          {'operators'===active_code    && <Operators wbs={wbs_data} />}
          {'wbs'===active_code          && <Wbs wbs={wbs_data} />}
        </>
    );
}

export default Home;
