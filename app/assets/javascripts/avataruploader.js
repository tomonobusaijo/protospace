window.addEventListener('turbolinks:load', function() {
  var uploadAvatar = document.getElementById('upload_avatar');
  var avatarImageId = document.getElementById('user_avatar');
  if ( uploadAvatar != null ){
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
  }
});

//jQuery版やってみたけどダメだったw

// $(document).on("turbolinks:load", function() {
//   var $uploadAvatar = $('#upload_avatar')[0];
//   var $avatarImageId = $('#user_avatar')[0];
//   if ( $uploadAvatar != null ){
//     $($uploadAvatar).on('change', function(e){
//       var $input = $uploadAvatar.files[0];
//       var $reader = new FileReader();
//       $($reader).on('load', function(e) {
//         $avatarImageId.src = $reader.result;
//       }, true);
//       $reader.readAsDataURL($input);
//     }, true);

//     $($avatarImageId).on('load', function(){
//       this.style.display = 'block';
//     });
//   }
// });
