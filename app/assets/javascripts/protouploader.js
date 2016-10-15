window.addEventListener('DOMContentLoaded', function() {
  var elements = document.querySelectorAll('input[type = file]');
  for ( i = 0, len = elements.length; i < len; i ++ ){
    elements[i].addEventListener('change', function(e){
      var input = document.getElementById(e.target.id).files[0];
      var imageId = e.target.nextElementSibling.id;
      var reader = new FileReader();
      reader.addEventListener('load', function(e) {
        document.getElementById(imageId).src = reader.result;
      }, true);
      reader.readAsDataURL(input);
    }, true);
  }
});
