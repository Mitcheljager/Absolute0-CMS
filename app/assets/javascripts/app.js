var app = new Vue({
  el: '.app',
  data: {
    message: 'Hi!',
    showModal: false,
    pages: []
  },
  beforeCreate: function() {
    var self = this;

    $.getJSON('/pages/json/list.json', function(json){
      self.pages = json;
    });
  },
  created: function() {
    setTimeout(function() {
      $('.app').removeClass('app--loading');
    });
  }
})
