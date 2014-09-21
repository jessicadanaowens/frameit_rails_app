var editPictureDescription = function() {

  $('em.picture-description').on('click', function () {
    if ($('input.edit-description').is(":visible")) {
      $('input.edit-description').hide();
      $(this).parent('.card-header').children('input').remove();
    } else {
      $(this).parent('.card-header').append("<input type='text' name='description' class='edit-description'/>" + "<input type='submit' value='save' class='submit-description'>");
    }
  });

  $('body').on('keyup', 'input.edit-description', function () {
    var newText = $(this).val();
    var currentText = $(this).parent('.card-header').children('em.picture-description');
    currentText.text(newText);
  });

  $('body').on('click', '.submit-description', function () {

    var newText = $(this).parent(".card-header").children("em").text();
    var id = $(this).parent('.card-header').parent('.card').data("id");
    $.ajax({
      type: "PATCH",
      url: "/pictures/" + id,
      dataType: "json",
      data: {file_name: newText},
      success: function() {
        $('input.edit-description').remove();
        $('input.submit-description').remove();
      }
    });
  });
};