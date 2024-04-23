(function ($) {
    $('#gender').parent().append('<ul class="list-item" id="newgender" name="gender"></ul>'); $('#gender option').each(function () { $('#newgender').append('<li value="' + $(this).val() + '">' + $(this).text() + '</li>'); }); $('#gender').remove(); $('#newgender').attr('id', 'gender'); $('#gender li').first().addClass('init'); $("#gender").on("click", ".init", function () { $(this).closest("#gender").children('li:not(.init)').toggle(); }); 
    var allOptions = $("#gender").children('li:not(.init)'); $("#gender").on("click", "li:not(.init)", function () { allOptions.removeClass('selected'); $(this).addClass('selected'); $("#gender").children('.init').html($(this).html()); allOptions.toggle(); }); 
    
    var marginSlider = document.getElementById('slider-margin');
        if (marginSlider != undefined) 
        { 
            noUiSlider.create(marginSlider, 
                { 
                start: [5], 
                step: 1, 
                connect: [true, false], 
                tooltips: [true], 
                range: { 'min': 0, 'max': 10 }, 
                format: wNumb({ decimals: 0, thousand: ',', prefix: ' ', }) 
                }); 
        }

    $('#reset').on('click', function () 
    { 
        $('#register-form').reset(); }); 
        $('#register-form').validate(
            { 
                rules: { full_name: { required: true, }, 
                DOB: { required: true, }, 
                nationality: { required: true },
                gender: { required: true }, 
                email: { required: true, email: true }, 
                phone_number: { required: true, } }, 
                onfocusout: function (element) { $(element).valid(); }, 
            }); 
            
            jQuery.extend(jQuery.validator.messages, { required: "", remote: "", email: "", url: "", date: "", dateISO: "", number: "", digits: "", creditcard: "", equalTo: "" });
})(jQuery);