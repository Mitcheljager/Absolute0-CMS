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
    newPage: false,
    columnFullSize: 0,
    flashMessage: '',
    menuVisible: true,
    currentTab: 'pages',
    forgotPassword: false,
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
        }, 100);  // FIXME Using Timeout is stupid, as the time required is not set.

        console.log('Page Loaded');
      });
    },
    tabClick: function(target){
      var self = this;

      self.currentTab = target;
    },
    updatePage: function() {
      var self = this;

      setTimeout(function() {
        self.loadPage();
      }, 100);  // FIXME Using Timeout is stupid, as the time required is not set.
    },
    onUpdateOfBlockDrag: function(evt) {
      var self = this;
      var updatedOrder = [];

      $('.block').each(function(i) {
        updatedOrder.push({ id: $(this).data('block-id'), position: i+1 });
      });

      $.ajax({
        type: 'POST',
        url: '/admin/blocks/sort',
        data: { order: updatedOrder },
        success: function(data) {
          console.log('Success')
        },
        error: function(data) {
          console.log('Error')
        }
      });

      console.log(updatedOrder);
    },
    onUpdateOfPageDrag: function(evt) {
      var self = this;

      var parentDiv = $(evt.to);
      var updatedOrder = [];

      $('.menu .menu__item').each(function(i) {
        console.log($(parentDiv).data('menu-id'));
        updatedOrder.push({ id: $(this).data('page-id'), menu_id: $(this).parent().data('menu-id'), position: i+1 });
      });

      $.ajax({
        type: 'POST',
        url: '/admin/pages/sort',
        data: { order: updatedOrder },
        success: function(data) {
          console.log('Success')
        },
        error: function(data) {
          console.log('Error')
        }
      });

      console.log(evt);
      console.log(updatedOrder);
    },
    onUpdateOfColumnDrag: function(evt) {
      var self = this;
      var updatedOrder = [];

      var parentDiv = $(evt.from);

      $(parentDiv).find('.column').each(function(i) {
        updatedOrder.push({ id: $(this).data('column-id'), position: i+1 });
      });

      $.ajax({
        type: 'POST',
        url: '/admin/columns/sort',
        data: { order: updatedOrder },
        success: function(data) {
          console.log('Success')
        },
        error: function(data) {
          console.log('Error')
        }
      });

      console.log(updatedOrder);
    },
    reloadSidebar: function(message) {
      var self = this;

      setTimeout(function() {
        $.getJSON('/pages/json/list.json', (json) => {
          app.pages = json;
        });
      }, 100); // FIXME Using Timeout is stupid, as the time required is not set.

      if (message) {
        self.flashMessage = message;
      }
    }
  },
  watch: {
    'currentPage': function(val, oldVal) {
      var self = this;

      self.loadPage();
    }
  }
});
