// 1234567
// 1000000 : class
// 1100000 : api
// 1200000 : procedures
// 1300000 : ???
// 1400000 : ???

function SEED_PROCEDURES () {
    return [
        {
            _id: 1000000, _parent: 100,
            label: 'XDファイルの取り込み',
            description: '',
        },
    ];
}
function SEED_CLASSES () {
    return [
        {
            _id: 1010000, _parent: 101,
            label: 'xd',
        },
    ];
}

const WORKPACKAGES = [
    ...SEED_PROCEDURES(),
    ...SEED_CLASSES(),
].map(d => {
    const wp = {...d};
    wp._class = 'WORKPACKAGE';
    return wp;
});

export default WORKPACKAGES;
