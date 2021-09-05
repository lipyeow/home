'use strict';

import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import MaterialTable from 'material-table'

class App extends Component {
  render() {
    return (
      <div style={{ maxWidth: '100%' }}>
        <MaterialTable
          columns={[
            { title: 'Adı', field: 'name' },
            { title: 'Soyadı', field: 'surname' },
            { title: 'Doğum Yılı', field: 'birthYear', type: 'numeric' },
            { title: 'Doğum Yeri', field: 'birthCity', lookup: { 34: 'İstanbul', 63: 'Şanlıurfa' } }
          ]}
          data={[{ name: 'Mehmet', surname: 'Baran', birthYear: 1987, birthCity: 63 }]}
          title="Demo Title"
        />
      </div>
    )
  }
}

const e = React.createElement;

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { liked: false };
  }

  render() {
    if (this.state.liked) {
      return 'You liked this.';
    }

    return (
        <button onClick={() => this.setState({ liked: true })}>
            Like
        </button>
    );
  }
}

const domContainer = document.querySelector('#PublicationsTable');
//ReactDOM.render(e(LikeButton), domContainer);
ReactDOM.render(e(App), domContainer);
