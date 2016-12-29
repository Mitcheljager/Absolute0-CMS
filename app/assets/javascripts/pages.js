Vue.component('page', {
  template: '#page',
  props: ['currentPageData'],
  data: function() {
    return {
      page: ''
    }
  },
  props: {
    currentPage: Object
  },
  methods: {
    loadPage: function() {
      $.getJSON('/pages/template/'+ pageId +'.json', function(json){
        currentPageData = json;
        self.currentPage = pageId;

        console.log('Page Loaded');
      });
    }
  },
  beforeCreate: function() {
    console.log(this.currentPage);
  }
})
