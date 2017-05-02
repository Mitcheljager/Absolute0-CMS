Vue.component('Modal', {
  template: '#modal-template',
  methods: {
    ready: function () {
      document.addEventListener('keydown', (e) => {
        if (this.show && e.keyCode == 27) {
          this.onClose();
        }
      });
    }
  }
});

Vue.component('NewPageModal', {
  template: '#new-page-modal-template',
  methods: {
    close: function() {
      app.showModal = false;
    },
    createPage: function() {
      app.showModal = false;
      app.flashMessage = 'Page Created';

      setTimeout(function() {
        $.getJSON('/pages/json/list.json', (json) => {
          app.pages = json;
        });
      }, 100); // FIXME Using Timeout is stupid, as the time required is not set.
    }
  }
});
