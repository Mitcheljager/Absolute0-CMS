Vue.component('modal', {
  template: '#modal--new-page',
  methods: {
    submitForm(postUrl = '/pages', formElement = 'form') {
      event.preventDefault();

      $.ajax({
        type: 'POST',
        url: postUrl,
        data: $(formElement).serialize(), // serializes the form's elements.
        success: function(data) {
          console.log(data); // show response from the php script.
        }
      });
    }
  },
  created: function() {

  }
})
