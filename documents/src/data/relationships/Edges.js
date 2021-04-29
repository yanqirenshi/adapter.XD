class Edges {
    makeData () {
        let i = 100000;
        return [
            { id: i++, source:  1, target:  6 },
            { id: i++, source:  1, target:  4 },
            { id: i++, source:  4, target:  5 },
            { id: i++, source:  1, target:  7 },
            { id: i++, source:  1, target:  8 },
            { id: i++, source:  1, target:  9, type: 'HAVE-TO' },
            { id: i++, source:  9, target: 10, type: 'HAVE-TO' },
            { id: i++, source:  1, target: 11, type: 'HAVE-TO' },
            { id: i++, source: 11, target:  9, type: 'REFERED-TO' },
            { id: i++, source: 11, target: 10, type: 'REFERED-TO' },
        ];
    }
}

export default Edges;
