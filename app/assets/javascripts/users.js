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

    $('.excercise-repetitions').on('change', function() {
        $(this).parent().find('.excercise-duration').val('');
    });

    $('.excercise-duration').on('change', function() {
        $(this).parent().find('.excercise-repetitions').val('');
    });

    $('#testimonials').height($(document).height());

    $('.edit-program').on('click', function() {
        debugger;
    });

    window.editProgramFor = function(day) {
        debugger;

        var form = $('.program-form[data-day=' + day + ']'),
            box = $('#program-box');

        box.removeClass('hidden');
        box.html(form.html());
    };

    window.showProgramFor = function(day) {
        var form = $('.program-details[data-day=' + day + ']'),
            box = $('#program-box');

        box.removeClass('hidden');
        box.html(form.html());
    };

    window.submitCurrentProgram = function() {
        var form = $('#program-box form');

        $.post('/save_program', form.serializeArray(), function(response) {
            if (response && response['success']) {
                showProgramFor(form.find('#program_day').val());
            }
        });
    };

    window.clearCurrentProgram = function() {
        var form = $('#program-box form');

        form.find('select').val('');

        showProgramFor(form.find('#program_day').val());
    };

    $('.programs-list .thumbnail').click(function() {
        var form = $(this).find('.program-form'),
            details = $(this).find('.program-details'),
            box = $('#program-box');

        if ($(this).hasClass('active')) {
            box.addClass('hidden');
            $('.thumbnail.active').removeClass('active');
        } else {
            box.html(details.html());
            // box.html(form.html());
            box.removeClass('hidden');
            $('.thumbnail.active').removeClass('active');
            $(this).addClass('active');
        }
    });
});