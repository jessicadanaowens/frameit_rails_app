var deleteFrame = function () {$('.delete-frame').on('click', function (e) {
  debugger;
  e.preventDefault();
  var $el = $(this);
  var frameId = $el.parents('ul').first().data("id");
  var picture = $el.parents('.frame-table-row');
  $.ajax({
    type: "DELETE",
    url: "/frames/" + frameId,
    dataType: "json",
    success: function () {
      picture.remove();
    }
  });
});
};
