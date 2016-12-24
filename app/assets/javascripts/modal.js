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
