export const GRAPH = `                   +-------------------------------------+
                   | Google Computing                    |
                   |                                     |
                   |              +-----------------+    |
                   |              | App Engine      |    |
                   |              |                 |    |
    +---------+    |   +-----+    |   +----------+  |    |    +---------------------+
    | Browser |<------>| IAP |<------>| Default  |  |    |    | Conoha              |
    +---------+    |   |     |    |   |  pwa/    |  |    |    |                     |
                   |   |     |    |   +----------+  |    |    |   +--------------+  |
                   |   |     |    |                 |    |    |   | VPS          |  |
      HoloLens2    |   |     |    |   +----------+  |    |    |   |   +-------+  |  |
                   |   |     |<------>| api      |<------------------>| Neo4j |  |  |
      SmartPhone   |   |     |    |   |  api/    |  |    |    |   |   +-------+  |  |
                   |   +-----+    |   +----------+  |    |    |   +--------------+  |
                   |              |        ^        |    |    +---------------------+
                   |              +--------|--------+    |
                   |                       |             |
                   |             +--------------------+  |
                   |             | Container Registry |  |
                   |             +--------------------+  |
                   |                                     |
                   +-------------------------------------+`;

let i = 1;
export const ELEMENTS = [
    { id: i++, name: 'Unity',      directory: '???',   lang: 'c#',                description: '' },
    { id: i++, name: 'Web',        directory: 'web/',  lang: 'React',             description: '' },
    { id: i++, name: 'PWA',        directory: '???',   lang: 'React',             description: '' },
    { id: i++, name: 'API',        directory: 'api/',  lang: 'Common Lisp',       description: '' },
    { id: i++, name: 'Core',       directory: 'core/', lang: 'Common Lisp',       description: '' },
    { id: i++, name: 'Web Server', directory: '',      lang: 'Google App Engine', description: '' },
    { id: i++, name: 'PWA Server', directory: '',      lang: 'Google App Engine', description: '' },
    { id: i++, name: 'Neo4j',      directory: '',      lang: 'Docker',            description: '' },
];
