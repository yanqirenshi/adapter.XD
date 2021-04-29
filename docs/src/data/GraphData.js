import Nodes from './relationships/Nodes.js';
import Edges from './relationships/Edges.js';

class GraphData {
    constructor () {
        this.obj_id = 100;
    }
    makeData (type) {
        if (type==='nodes')
            return new Nodes().makeData();

        if (type==='edges')
            return new Edges().makeData();

        return [];
    }
    makeNodeData () {
        return {
            id: this.obj_id++,
            _class: 'XXX',
            x: 0,
            y: 0,
            label: {
                text: 'XXX',
                font: { size: 12 },
            },
            circle: {
                r: 33,
                fill: '#eeeeee',
                stroke: { color: '#888888', width: 1 },
            },
        };
    }
    makeEdgeData (from, to) {
        return {
            id: this.obj_id++,
            source: from.id,
            target: to.id,
        };
    }
};

export default GraphData;
