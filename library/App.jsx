var React = require('react');
var Interface = require('./Interface.jsx');

var App = React.createClass({
  getInitialState: function() {
    return {
      item: {
        url: 'http://example.com',
        name: 'i am a name',
        image: 'http://example.com',
        price: 0.25
      }
    };
  },
  like: function() {
    return;
  },
  pass: function() {
    return;
  },
  view: function() {
    window.open(
      this.state.item.url,
      this.state.item.name.toLowerCase().replace(new RegExp(/\w/g), '')
    );
  },
  render: function() {
    return (
      <Interface
        item={this.state.item}
        like={this.like}
        pass={this.pass}
        view={this.view}
      />
    );
  } 
});
React.render(<App/>, document.body);
