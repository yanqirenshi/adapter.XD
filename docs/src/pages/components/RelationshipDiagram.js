import React, { useState } from 'react';
import D3Network, {Camera} from '@yanqirenshi/d3.network';

const style = {
    padding: 22,
};

export default function RelationshipDiagram (props) {
    const [camera] = useState(new Camera({
        look: {
            at: {
                x:   0,
                y: 100,
            },
            scale: 2,
        },
    }));

    const graph_data = {
        nodes: props.data.makeData('nodes'),
        edges: props.data.makeData('edges'),
    };

    const style_container = {
        height: props.h || 333,
        border: '1px solid #888888',
    };

    return (
        <div style={style}>
          <div style={style_container}>
            <D3Network source={graph_data}
                       camera={camera} />
          </div>
        </div>
    );
}
