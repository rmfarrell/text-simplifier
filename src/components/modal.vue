<template lang="jade">
  .modal(v-if="isOpen")
    a(@click="close")
    .modal-content: slot
</template>

<script scoped lang="coffee">
  module.exports =

    props:
      isOpen:
        type: Boolean
        default: false

    methods:
      close: ->
        @isOpen = false

</script>