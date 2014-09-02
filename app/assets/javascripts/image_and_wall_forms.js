var forms = function() {

  var pictureFormButton = $('#picture-form-button');
  var uploadPictureForm = $('#upload-picture-form');
  var wallFormButton = $('#wall-form-button');
  var uploadWallForm = $('#upload-wall-form');

  uploadPictureForm.hide();
  uploadWallForm.hide();

  pictureFormButton.on('click', function (e) {
    e.preventDefault();
    pictureFormButton.css("font-weight","Bold");
    wallFormButton.css("font-weight","");
    uploadPictureForm.show();
    uploadWallForm.hide();
  });

  wallFormButton.on('click', function (e) {
    e.preventDefault();
    wallFormButton.css("font-weight","Bold");
    pictureFormButton.css("font-weight","");
    uploadPictureForm.hide();
    uploadWallForm.show();
  });
};

