Vue   = require('vue')
store = require ('./stores/words.coffee')

Vue.directive('color-highlighter', {


  update: (new_val, old_val) ->
    @el.innerHTML = ""
    words = new_val.split(/[\s-/]/)
    words.forEach( (word) =>
      index = store.get_index(
        word.replace(/[^\w]/g, '')
      )
      color = calculate_color(index)
      word = " <word-lookup style='color: #{color}'>#{word}</word-lookup>"
      @el.innerHTML += word
    )
})

# Helpers
calculate_color = (idx) ->
  if idx > -1
    r_val = Math.round (idx / 10000) * 255
    b_val = Math.round 255 - ((idx / 10000) * 255)
    return "rgb(#{r_val}, 0, #{b_val})"