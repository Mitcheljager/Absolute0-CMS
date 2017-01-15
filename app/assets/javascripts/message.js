Vue.component('message', {
  props: ['content'],
  template: '<div class="message">{{ content }}</div>',
  created: function() {
    setTimeout(function() {
      app.flashMessage = ''
    }, 3000)
  }
})
