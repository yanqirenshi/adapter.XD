const WBS01 = [
    {
        _id: 100, _parent: 1,
        order: 5,
        label: 'Procedures',
    },
    {
        _id: 101, _parent: 1,
        order: 10,
        label: 'Classes',
    },
    {
        _id: 102, _parent: 1,
        order: 15,
        label: 'Operators',
    },
    {
        _id: 103, _parent: 1,
        order: 20,
        label: 'API',
    },];

function buildWbs () {
    const addClass = (d) => {
        d._class = 'WBS';
        return d;
    };

    return [...WBS01].map(addClass);
}

const WBS = buildWbs();

export default WBS;
