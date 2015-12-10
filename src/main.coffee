Vue               = require('vue')
css               = require('./assets/style.styl')
parent_template   = require('jade!./index.jade')
filters           = require('./directives.coffee')
modal             = require('./components/modal.vue')
word_lookup       = require('./components/word-lookup.vue')

new Vue({
  el: '#app'
  template: parent_template()
  replace: false
  data:
    text: ""
    words: ['shit']
  components:
    'word-lookup': word_lookup
})