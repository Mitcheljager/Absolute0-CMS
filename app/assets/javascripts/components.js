Vue.component('component', {
  props: ['content', 'layout'],
  data: function() {
    return {
      component: this.content
    }
  }
})
