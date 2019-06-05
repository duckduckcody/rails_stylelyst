<template>
  <div id="app">
    <div class="header">
      <h1 class="header-brand">Stylelyst</h1>
      <a class="header-settings header-link" href="/clothes/settings">Settings</a>
    </div>
    <body>
      <h1>My Vue App!</h1>
    </body>
  </div>
</template>

<script>
  export default {
    name: 'app'
  }
  // need to make both clothes and settings components
  // then add router to go between them
</script>

<style scoped>
  h1 {
    text-align: center;
  }
</style>
