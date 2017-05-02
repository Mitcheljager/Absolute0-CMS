Vue.component('alert', {
  props: ['content'],
  template: '<div class="alert"><h3>Notification</h3><span>{{ content }}</span></div>',
  created: function() {
    setTimeout(function() {
      $('.alert').addClass('alert--is-flying-out');
    }, 2500);
    setTimeout(function() {
      app.flashMessage = ''
    }, 3000);
  }
})
