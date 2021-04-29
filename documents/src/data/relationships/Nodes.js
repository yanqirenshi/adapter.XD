class Nodes {
    makeData () {
        let defaultCircle = {
            r: 33,
            fill: '#eeeeee',
            stroke: { color: '#888888', width: 1 },
        };

        return [
            {
                id: 1,
                _class: 'NODE',
                x: 0, y: 0,
                circle: {...defaultCircle},
                label: { text: 'Genius', font: { size: 33 } },
                move: 'freeze',
                data: {
                    code: 'GENIUS',
                    name: 'Genius',
                    attributes: ['name', 'description'] ,
                },
            },
            {
                id: 4,
                _class: 'NODE',
                x: -300, y: -200,
                move: 'freeze',
                label: { text: 'Guild', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'GUILD',
                    name: 'Guild',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 5,
                _class: 'NODE',
                x: -600, y: -200,
                move: 'freeze',
                label: { text: 'Union', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'UNION',
                    name: 'Union',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 6,
                _class: 'NODE',
                move: 'freeze',
                x: 300, y: 0,
                label: { text: 'Asset', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'ASSET',
                    name: 'Asset',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 7,
                _class: 'NODE',
                x: -300, y: 0,
                move: 'freeze',
                label: { text: 'Deccot', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'DECCOT',
                    name: 'Deccot',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 8,
                _class: 'NODE',
                x: 0, y: -200,
                move: 'freeze',
                label: { text: 'Party', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'PARTY',
                    name: 'Party',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 9,
                _class: 'NODE',
                x: 300, y: 200,
                move: 'freeze',
                label: { text: 'Book', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'BOOK',
                    name: 'Book',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 10,
                _class: 'NODE',
                x: 600, y: 200,
                move: 'freeze',
                label: { text: 'Section', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'SECTION',
                    name: 'Section',
                    attributes: ['name', 'description'],
                },
            },
            {
                id: 11,
                _class: 'NODE',
                x: 300, y: 400,
                move: 'freeze',
                label: { text: 'Note', font: { size: 33 } },
                circle: {...defaultCircle},
                data: {
                    code: 'NOTE',
                    name: 'Note',
                    attributes: ['name', 'description'],
                },
            },
        ];
    }
};

export default Nodes;
