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

Vue.component('NewMenuModal', {
  template: '#new-menu-modal-template',
  created: function() {
    setTimeout(function(){
      var positionLeft = $(".createMenuModal")[0].getBoundingClientRect().left,
          positionTop = $(".createMenuModal")[0].getBoundingClientRect().top;

      $(".modal__container").css({"left": positionLeft, "top": positionTop - 520});
    });
  },
  methods: {
    close: function() {
      app.showModal = false;
    },
    createPage: function() {
      app.showModal = false;
      app.flashMessage = 'Menu is successfully created';

      setTimeout(function() {
        $.getJSON('/pages/json/list.json', (json) => {
          app.pages = json;
        });
      }, 100); // FIXME Using Timeout is stupid, as the time required is not set.
    }
  }
});
