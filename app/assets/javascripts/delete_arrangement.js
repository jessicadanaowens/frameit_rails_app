var deleteArrangement = function () {$('.delete-arrangement').on('click', function (e) {
  e.preventDefault();
  var $el = $(this);
  var arrangementId = $el.parents('ul').first().data("id");
  var arrangement = $el.parents('div.card');
  $.ajax({
    type: "DELETE",
    url: "/arrangements/" + arrangementId,
    dataType: "json",
    success: function () {
      arrangement.hide();
    }
  });
});
};