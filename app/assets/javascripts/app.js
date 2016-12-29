var app = new Vue({
  el: '.app',
  data: {
    message: 'Absolute 0 CMS',
    showModal: false,
    pages: [],
    blocks: [],
    columns: [],
    items: [],
    currentPage: 0,
    currentPageData: [],
    page: this.currentPageData
  },
  beforeCreate: function() {
    var self = this;

    $.getJSON('/pages/json/list.json', function(json){
      self.pages = json;
    });

    $.getJSON('/blocks/json/list.json', function(json){
      self.blocks = json;
    });

    $.getJSON('/columns/json/list.json', function(json){
      self.columns = json;
    });

    $.getJSON('/components/json/list.json', function(json){
      self.items = json;
    });
  },
  created: function() {
    setTimeout(function() {
      $('.app').removeClass('app--loading');
    });
  },
  methods: {
    loadPage: function() {
      var self = this;

      $('.page').addClass('page--fade-out');

      $.getJSON('/pages/template/'+ self.currentPage +'.json', function(json){

        setTimeout(function() {
          self.currentPageData = json;
          
          $('.page').removeClass('page--fade-out');
        }, 300);

        console.log('Page Loaded');
      });
    }
  },
  watch: {
    'currentPage': function(val, oldVal){
      this.loadPage();
    }
  }
})
