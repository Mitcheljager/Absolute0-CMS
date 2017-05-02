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
  created: function() {
    setTimeout(function(){
      var positionLeft = $(".createPageModal")[0].getBoundingClientRect().left,
          positionTop = $(".createPageModal")[0].getBoundingClientRect().top;

      $(".modal__container").css({"left": positionLeft, "top": positionTop - 520});
    });
  },
  methods: {
    close: function() {
      app.showModal = false;
    },
    createPage: function() {
      app.showModal = false;
      app.flashMessage = 'Page is successfully created';

      setTimeout(function() {
        $.getJSON('/pages/json/list.json', (json) => {
          app.pages = json;
        });
      }, 100); // FIXME Using Timeout is stupid, as the time required is not set.
    }
  }
});
