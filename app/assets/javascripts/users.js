$(function() {
    $('.new-excercise select[name=excercise_type]').on('change', function() {
        var parent = $(this).parent('.new-excercise'),
            new_form = parent.clone();

        parent.removeClass('new-excercise');
        parent.after(new_form);
    });

    $('.program-details form').on('submit', function() {
        $.post('/save_program', $(this).serializeArray(), function(response) {
            if (response && response['success']) {
                alert('Saved!');
            }
        });
    });
});