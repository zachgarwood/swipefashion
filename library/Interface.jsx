var React = require('react');

module.exports = React.createClass({
  render: function() {
    return (
      <div id='interface'>
        <a onClick={this.props.view}>
          <h2>{this.props.item.name}</h2>
          <img src={this.props.item.image}/>
          <p>${this.props.item.price}</p>
        </a>
        <button onClick={this.props.pass}>Pass</button>
        <button onClick={this.props.view}>View</button>
        <button onClick={this.props.like}>Like</button>
      </div>
    );
  }
});
