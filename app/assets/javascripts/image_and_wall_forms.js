var forms = function() {

  var pictureFormButton = $('#picture-form-button');
  var uploadPictureForm = $('#upload-picture-form');
  var wallFormButton = $('#wall-form-button');
  var uploadWallForm = $('#upload-wall-form');

  uploadPictureForm.hide();
  uploadWallForm.hide();

  pictureFormButton.on('click', function (e) {
    e.preventDefault();
    uploadPictureForm.show();
    uploadWallForm.hide();
  });

  wallFormButton.on('click', function (e) {
    e.preventDefault();
    uploadPictureForm.hide();
    uploadWallForm.show();
  });
};

