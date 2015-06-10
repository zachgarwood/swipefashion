var BackboneReactMixin = require('backbone-react-component');
var React = require('react');
var Card = require('./Card.jsx');

module.exports = React.createClass({
  mixins: [BackboneReactMixin],
  getNextItem: function() {
    var collection = this.getCollection();
    collection.shift();
    if (collection.length <= 1) {
      collection.fetch({data: {user_id: this.props.user.id}});
    }

    return collection.first();
  },
  getInitialState: function() {
    return {currentItem: this.getCollection().first()};
  },
  like: function() {
    this.state.currentItem.save( {
      liked: true,
      user_id: this.props.user.id
    }, {
      patch: true
    });
    this.setState({currentItem: this.getNextItem()});
  },
  pass: function() {
    this.state.currentItem.save({
      passed: true,
      user_id: this.props.user.id
    }, {
      patch: true
    });
    this.setState({currentItem: this.getNextItem()});
  },
  view: function() {
    this.state.currentItem.save({
      viewed: true,
      user_id: this.props.user.id
    }, {
      patch: true
    });
    window.open(
      this.state.currentItem.get('url'),
      this.state.currentItem.get('name').toLowerCase().replace(new RegExp(/\w/g), '')
    );
  },
  render: function() {
    return (
      <div id='interface'>
        <Card model={this.state.currentItem} view={this.view}/>
        <button onClick={this.pass}>Pass</button>
        <button onClick={this.view}>Details</button>
        <button onClick={this.like}>Like</button>
      </div>
    );
  }
});
