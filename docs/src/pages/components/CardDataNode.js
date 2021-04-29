import React from 'react';
import { Link } from "react-router-dom";
import { Card, Media, Heading, Content } from 'react-bulma-components';

const style = {
    width:222,
    margin: 11,
};

export default function CardDataNode (props) {
    const data = props.data;
    const to = `/nodes/${props.data.code.toLowerCase()}`;

    return (
        <Card style={style}>
          <Card.Content>

            <Media>
              <Heading size={4}>
                <Link to={to}>
                  {data.name}
                </Link>
              </Heading>
            </Media>

            <Content>
              {data.attributes.map(d => {
                  return <p key={d}>{d}</p>;
              })}
            </Content>

          </Card.Content>
        </Card>
    );
}
