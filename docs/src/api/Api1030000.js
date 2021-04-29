import React from 'react';

import {Section, Container, Heading, Content} from 'react-bulma-components';

import Hero from './Hero.js';

const cloud_app = <code>Cloud App</code>;
const gc_iap = <code>GC IAP</code>;

export default function Api1030000 (props) {
    return (
        <div>
          <Hero label="GET /genius"
                location={props.location}/>

          <Section>
            <Container>
              <Heading>概要</Heading>

              <Content>
                <p>こんな感じの経路。</p>

                <pre>Front(Web) → GC IAP → Cloud App</pre>

                <p>
                  {gc_iap} で ID 情報が付与されて、{cloud_app} に連携されます。
                </p>

                <p>
                  {cloud_app} では {gc_iap} でリクエストヘッダに付与された ID 情報で deccot を探します。
                </p>
                <p>
                  deccot が存在すれば、それに紐づく genius を返します。
                </p>

                <p>
                  deccot が存在しなければ、deccot と genius を作成し、その二つを関連づけます。
                </p>
              </Content>
            </Container>
          </Section>
        </div>
    );
}
