    console.log("///////////////");
    $('#credit').hide();
    $('#bash').hide();
    s = $('#payment_history_pay_type');
    $('#payment_history_pay_type').change(function(){
        console.log(s.val());
        if(s.val() == 'bkash' ) {
            console.log(s.val());
            $('#bash').show();
            // $('#bash').removeClass('d-none');

            $('#credit').hide();}

        else if (s.val() == 'credit card' ) {
            $('#credit').show();
            $('#bash').hide();
        }
        else
        {
            $('#credit').hide();
            $('#bash').hide();
        }



    });
