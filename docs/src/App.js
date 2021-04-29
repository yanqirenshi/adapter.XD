import React, { useState, useEffect } from 'react';

import Sogh from '@yanqirenshi/sogh';

import RootPc from './RootPc.js';

function App() {
    const [token] = useState(process.env.REACT_APP_GITHUB_PARSONAL_TOKEN);
    const [sogh, setSogh] = useState(null);
    const [repo, setRepo] = useState(null);

    useEffect(() => {
        if (!token) return;

        new Sogh().connect(token,
                           (sogh) => setSogh(sogh),
                           () => console.error('Sign In Error: SOGH Error'));
    }, [token]);

    useEffect(() => {
        if (!sogh) return;

        sogh.fetchRepository('yanqirenshi', 'GeniusParty', (success) => {
            setRepo(sogh.getRepository('yanqirenshi', 'GeniusParty'));
        });
    }, [sogh]);

    return (
        <>
          <RootPc sogh={sogh} repo={repo} />
        </>
    );
}

export default App;
