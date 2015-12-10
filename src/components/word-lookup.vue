<template lang="jade">
  span(@click="lookup")
    slot
  modal(:is-open='thesaurus_deployed')
    ul
      li(v-for="word in thesaurus_content") {{word[0]}}, {{word[1]}}


</template>

<style scoped lang="stylus">
</style>

<script lang="coffee">
  thesaurus = require('../stores/thesaurus.coffee')
  modal     = require('./modal.vue')

  module.exports =

    data: ->
      thesaurus_deployed: false
      thesaurus_content: {}

    components:
      modal: modal

    methods:

      lookup: () ->
        word = @$el.nextSibling.innerHTML || ""
        thesaurus.lookup(word).then( (data) =>
          @thesaurus_deployed = !@thesaurus_deployed
          @thesaurus_content = data
        )

</script>