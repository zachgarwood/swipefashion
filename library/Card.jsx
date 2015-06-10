var BackboneReactMixin = require('backbone-react-component');
var React = require('react');

module.exports = React.createClass({
  mixins: [BackboneReactMixin],
  render: function() {
    return (
      <div id='card' onClick={this.props.view}>
        <h2>{this.getModel().get('name')}</h2>
        <h3>{this.getModel().get('brand')}</h3>
        <img src={this.getModel().get('image')}/>
        <p>${this.getModel().get('price')}</p>
      </div>
    );
  }
});
