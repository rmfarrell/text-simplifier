all_the_words = require('./most_common_words.coffee')

module.exports = {

  get_index: (word) ->
    all_the_words.indexOf(word.toLowerCase())
}