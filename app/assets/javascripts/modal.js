Vue.component('modal', {
  template: '#modal--new-page',
  methods: {
    createPage: function() {
      app.showModal = false;
      app.flashMessage = 'Page Created';

      setTimeout(function() {
        $.getJSON('/pages/json/list.json', (json) => {
          app.pages = json;
        });
      }, 100); // FIXME Using Timeout is stupid, as the time required is not set. 
    }
  },
  created: function() {

  }
})
