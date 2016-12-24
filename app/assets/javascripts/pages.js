var pagesList;

Vue.component('modal', {
  template: '#modal--new-page',
  methods: {
    submitForm(postUrl, formElement) {
      $(formElement).submit(function(event) {
        event.preventDefault();
        
        $.ajax({
          type: "POST",
          url: postUrl,
          data: $(formElement).serialize(), // serializes the form's elements.
          success: function(data) {
            alert(data); // show response from the php script.
          }
        });

      });
    }
  }
})

Vue.component('page', {
  props: ['pages'],
  template: '<li>{{ pages.title }}</li>'
})

var app = new Vue({
  el: '.app',
  data: {
    message: 'Hi!',
    showModal: false,
    pages: []
  },
  beforeCreate: function () {
    var self = this;

    $.getJSON('/pages/json/list.json', function(json){
      self.pages = json;
    });
  }
})
