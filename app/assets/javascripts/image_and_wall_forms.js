var forms = function() {

  var pictureFormButton = $('#picture-form-button');
  var uploadPictureForm = $('#upload-picture-form');
  var wallFormButton = $('#wall-form-button');
  var uploadWallForm = $('#upload-wall-form');

  uploadPictureForm.hide();
  uploadWallForm.hide();
  $('.down-triangle').hide();



  pictureFormButton.on('click', function (e) {
    e.preventDefault();

    if ($('#upload-picture-form').is(":visible")) {
      uploadPictureForm.hide();
      $(this).children('em.down-triangle').hide();
      $(this).children('em.right-triangle').show();
      pictureFormButton.css("font-weight", "");

    } else {
      $(this).children('em.down-triangle').show();
      $(this).children('em.right-triangle').hide();
      debugger
      $('#wall-form-button').children('em.right-triangle').show();
      $('#wall-form-button').children('em.down-triangle').hide();
      pictureFormButton.css("font-weight", "Bold");
      wallFormButton.css("font-weight", "");
      uploadPictureForm.show();
      uploadWallForm.hide();
    }
  });

  wallFormButton.on('click', function (e) {
    e.preventDefault();
    if ($('#upload-wall-form').is(":visible")) {
      uploadWallForm.hide();
      $(this).children('em.down-triangle').hide();
      $(this).children('em.right-triangle').show();
      wallFormButton.css("font-weight", "");
    } else {
      $(this).children('em.down-triangle').show();
      $(this).children('em.right-triangle').hide();
      $('#picture-form-button').children('em.right-triangle').show();
      $('#picture-form-button').children('em.down-triangle').hide();
      wallFormButton.css("font-weight", "Bold");
      pictureFormButton.css("font-weight", "");
      uploadPictureForm.hide();
      uploadWallForm.show();
    }
  });
};

