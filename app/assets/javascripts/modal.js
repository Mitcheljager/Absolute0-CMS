Vue.component('modal', {
  template: '#modal--new-page',
  methods: {
    createPage: function() {
      app.showModal = false;
      app.flashMessage = 'Page Created';
    }
  },
  created: function() {

  }
})
