var deleteWall = function () {$('.delete-wall').on('click', function (e) {
  e.preventDefault();
  var $el = $(this);
  var wallId = $el.parents('ul').first().data("id");
  var wall = $el.parents('div.card');
  $.ajax({
    type: "DELETE",
    url: "/walls/" + wallId,
    dataType: "json",
    success: function () {
      wall.hide();
    }
  });
});
};