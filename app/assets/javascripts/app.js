var app = new Vue({
  el: '.app',
  data: {
    title: 'Absolute 0 CMS',
    showModal: false,
    pages: [],
    blocks: [],
    columns: [],
    items: [],
    currentPage: 0,
    currentPageData: [],
    page: this.currentPageData,
    menuVisible: false,
    newPage: false,
    columnFullSize: 0,
    flashMessage: '',
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
  },
  methods: {
    loadPage: function() {
      var self = this;

      $.getJSON('/pages/template/'+ self.currentPage +'.json', function(json){
        setTimeout(function() {
          self.currentPageData = json;
        }, 100);

        console.log('Page Loaded');
      });

      if (self.menuVisible) {
        self.toggleMenu();
      }
    },
    toggleMenu: function(){
      this.menuVisible = !this.menuVisible;
    },
    updatePage: function() {
      var self = this;

      setTimeout(function() {
        self.loadPage();
      }, 100)
    }
  },
  watch: {
    'currentPage': function(val, oldVal) {
      var self = this;

      self.loadPage();
    },
    'menuVisible': function(val, oldVal) {
      if (this.menuVisible) {
        var self = this;

        $.getJSON('/pages/json/list.json', (json) => {
          self.pages = json;
        });
      }
    }
  }
})
