import React, { Component } from 'react';
import {
  Header,
  Segment,
  Container,
  Card,
  Image,
} from 'semantic-ui-react';
import axios from 'axios';

class Home extends Component {
  state = { guitars: [] }

  componentDidMount() {
    axios.get('/api/guitars')
      .then( res => {
        this.setState({ guitars: res.data })
      })
  }

  displayGuitars = () => {
    const { guitars } = this.state;
    return guitars.map( guitar => {
      return(
        <Card>
          <Card.Content>
            <Card.Header>
              { guitar.name }
            </Card.Header>
            <Image src={ guitar.image_url } />
            <Header as='h4'>{ guitar.price }</Header>
            <Header as='h5'>{ guitar.stars }</Header>
          </Card.Content>
        </Card>
      )
    })
  }

  render() {
    return (
      <Container>
        <Segment inverted basic>
          <Header as='h1' inverted textAlign='center'>Sweet guitars brah</Header>
          <Card.Group stackable itemsPerRow={3}>
            { this.displayGuitars() }
          </Card.Group>
        </Segment>
      </Container>
    );
  }
}

export default Home;

