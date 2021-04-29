import React from 'react';
import {
    Section, Container, Heading, Content, Table
} from 'react-bulma-components';

import * as DG from '../../data/DEPLOYMENT_DIAGRAM.js';

function DeploymentDiagram () {
    return (
        <Section>
          <Container>
            <Heading>配置図</Heading>

            <Content>
              <pre style={{lineHeight: '14px'}}>{DG.GRAPH}</pre>
            </Content>

            <Content style={{marginTop:22}}>

              <Table>
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Lang</th>
                    <th>Description</th>
                  </tr>
                </thead>

                <tbody>
                  {DG.ELEMENTS.map(d => {
                      return <tr key={d.id}>
                               <td>{d.id}</td>
                               <td>{d.name}</td>
                               <td>{d.lang}</td>
                               <td>{d.description}</td>
                             </tr>;
                  })}
                </tbody>
              </Table>

            </Content>
          </Container>
        </Section>
    );
}

export default DeploymentDiagram;
