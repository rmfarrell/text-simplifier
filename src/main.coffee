Vue             = require('vue')
css             = require('./assets/style.styl')
parent_template = require('jade!./index.jade')
filters         = require('./filters.coffee')

new Vue({
  el: '#app'
  template: parent_template()
  replace: false
  data:
    text: ""
})