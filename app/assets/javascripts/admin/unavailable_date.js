
  // dynamic add input group
  $(document).on('click', '.btn-add', function(e) {
    e.preventDefault();

    var controlForm = $(this).parents('.dynamic-controls').first(),
        currentEntry = $(this).parents('.entry').first(),
        newEntry = $(currentEntry.clone()).appendTo(controlForm);

        newEntry.find('input').val('');
        controlForm.find('.entry:not(:last) .btn-add')
                .removeClass('btn-add').addClass('btn-remove')
                .removeClass('btn-success').addClass('btn-danger')
                .html('<span class="glyphicon glyphicon-minus"></span>');
  }).on('click', '.btn-remove',function (e) {
    e.preventDefault();
    $(this).parents('.entry').first().remove();
    return false;
  });