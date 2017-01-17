Vue.component('alert', {
  props: ['content'],
  template: '<div class="alert">{{ content }}</div>',
  created: function() {
    setTimeout(function() {
      $('.alert').addClass('alert--is-flying-out');
    }, 2500);
    setTimeout(function() {
      app.flashMessage = ''
    }, 3000);
  }
})
