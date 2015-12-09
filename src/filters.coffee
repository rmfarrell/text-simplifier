Vue   = require('vue')
store = require ('./stores/words.coffee')

Vue.filter('colorize', (input) ->
  output = ""
  words = input.split(/[\s-/]/)
  words.forEach( (word)->
    index = store.get_index(
      word.replace(/[^\w]/g, '')
    )
    color = calculate_color(index)
    word = " <span style='color: #{color}'>#{word}</span>"
    output += word
  )

  return output
)

# Helpers
calculate_color = (idx) ->
  if idx > 0
    r_val = Math.round (idx / 10000) * 255
    b_val = Math.round 255 - ((idx / 10000) * 255)
    return "rgb(#{r_val}, 0, #{b_val})"

  else
    return "inherit"