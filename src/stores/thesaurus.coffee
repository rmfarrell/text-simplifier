aja     = require('aja')
promise = require('bluebird')

# Hide this value
thesuarus_key = '7271484d781e95d97283fa7417bfe081'

module.exports =

  lookup: (word) ->
    return new Promise( (resolve, reject)->
      aja()
        .url("http://words.bighugelabs.com/api/2/#{thesuarus_key}/#{word}/json")
        .type('json')
        .on('success', (data) ->
          synonyms = []
          for part_of_speech, type of data
            for word in type.syn
              synonyms.push([word,"(#{part_of_speech})"])
          synonyms
          resolve synonyms
        )
        .on('40*', (response) ->
          reject data
        )
        .on('500', (response) ->
          reject data
        )
        .go()
    )
