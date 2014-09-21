var deletePicture = function () {$('.delete-picture').on('click', function (e) {
  e.preventDefault();
  var $el = $(this);
  var pictureId = $el.parents('ul').first().data("id");
  var picture = $el.parents('div.card');
  $.ajax({
    type: "DELETE",
    url: "/pictures/" + pictureId,
    dataType: "json",
    success: function () {
      picture.hide();
    }
  });
});
};
