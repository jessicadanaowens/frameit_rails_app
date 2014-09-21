var sharePicture = function() {

  //share an unshare a picture

  $('.share-it-link').on('click', function (e) {
    e.preventDefault();
    var $el = $(this);
    var pictureId = $el.parents('ul').first().data("id");
    console.log(pictureId);

    if ($el.hasClass('share')) {
      $.ajax({
        type: "POST",
        url: "/share_picture/" + pictureId,
        dataType: "json",
        success: function () {
          $el.text("don't share").addClass("unshare").removeClass('share');
        }
      });
    } else {
      $.ajax({
        type: "DELETE",
        url: "/unshare_picture/" + pictureId,
        dataType: "json",
        success: function () {
          console.log("whatever");
          $el.text("share it").addClass("share").removeClass('unshare');
        }
      });
    }
    return false;
  });

};