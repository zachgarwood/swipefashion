var $ = require('jquery');
var Backbone = require('backbone');
var Interface = require('./Interface.jsx');
var React = require('react');
var Store = require('store');
var Uuid = require('node-uuid');

$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
  options.url = 'http://private-75680-pissapi.apiary-mock.com' + options.url;
});

var User = Backbone.Model.extend({
  initialize: function() {
  console.log(Store.get('user_id'));
    if ((id = Store.get('user_id')) == 'undefined') {
      id = Uuid.v4();
      Store.set('user_id', id);
    }
    this.id = id;
  }
});

var Item = Backbone.Model.extend({});

var Items = Backbone.Collection.extend({
  model: Item,
  url: '/items'
});

Interface = React.createFactory(Interface);

user = new User();

items = new Items();
items.fetch({data: {user_id: user.id}}).done(function() {
  React.render(Interface({collection: items, user: user}), document.body);
});
