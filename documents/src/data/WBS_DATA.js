import PROJECTS from './wbs/PROJECTS.js';
import WBS from './wbs/WBS.js';
import WORKPACKAGES from './wbs/WORKPACKAGES.js';

let i = 10000000;
function buildEdges () {
    const nodes = [
        ...PROJECTS,
        ...WBS,
        ...WORKPACKAGES,
    ];

    const index = nodes.reduce((ht, d) => {
        ht[d._id] = d;
        return ht;
    }, {});

    return nodes.reduce((list, d) => {
        if (!d._parent)
            return list;

        const parent = index[d._parent];

        if (!parent)
            return list;

        list.push({
            _id: i++,
            from_id: parent._id,
            from_class: parent._class,
            to_id: d._id,
            to_class: d._class,
        });

        return list;
    }, []);
}

export const EDGES = buildEdges();

export {
    PROJECTS,
    WBS,
    WORKPACKAGES,
};
