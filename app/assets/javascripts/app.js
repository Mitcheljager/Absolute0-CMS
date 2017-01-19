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
      var updated_order = []

      $('.block').each(function(i) {
        $(this).attr('data-position', i+1);
      });

      $('.block').each(function() {
        updated_order.push({ id: $(this).data('block-id'), position: $(this).data('position') });
      });

      $.ajax({
        type: 'POST',
        url: '/blocks/sort',
        data: { order: updated_order }
      });
    }
  },
  watch: {
    'currentPage': function(val, oldVal) {
      var self = this;

      self.loadPage();
    }
  }
});
