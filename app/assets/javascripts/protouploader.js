window.addEventListener('turbolinks:load', function() {
  var protoImages = document.querySelectorAll('.proto_uploader');
  if ( protoImages != null ){
    for ( i = 0, len = protoImages.length; i < len; i ++ ){
      protoImages[i].addEventListener('change', function(e){
        var input = document.getElementById(e.target.id).files[0];
        var imageId = e.target.nextElementSibling.id;
        var reader = new FileReader();
        reader.addEventListener('load', function(e) {
          document.getElementById(imageId).src = reader.result;
        }, true);
        reader.readAsDataURL(input);
      }, true);
    }
  }
});
