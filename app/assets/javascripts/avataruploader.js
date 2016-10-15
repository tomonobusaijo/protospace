window.addEventListener('DOMContentLoaded', function() {
  var uploadAvatar = document.getElementById('upload_avatar');
  var avatarImageId = document.getElementById('user_avatar');
  uploadAvatar.addEventListener('change', function(e){
    var input = uploadAvatar.files[0];
    var reader = new FileReader();
    reader.addEventListener('load', function(e) {
      avatarImageId.src = reader.result;
    }, true);
    reader.readAsDataURL(input);
  }, true);

  avatarImageId.addEventListener('load', function(){
    this.style.display = 'block';
  });
});
