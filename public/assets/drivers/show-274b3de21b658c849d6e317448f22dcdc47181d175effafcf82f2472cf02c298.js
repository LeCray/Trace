
$(document).ready(function(){

    var $parameters             = $("#parameters");

    $('#cars-btn').click(function(){
        $('#cars').show();
        $('#cars-heading').show();

        $('#invoices').hide(); 
        $('#invoices-heading').hide();
        $('#bookings').hide(); 
        $('#bookings-heading').hide();
    }); 

    $('#invoices-btn').click(function(){
        $('#invoices').show(); 
        $('#invoices-heading').show();

        $('#cars').hide();
        $('#cars-heading').hide();
        $('#bookings').hide(); 
        $('#bookings-heading').hide();

    }); 

    $('#bookings-btn').click(function(){
        $('#bookings').show(); 
        $('#bookings-heading').show();

        $('#cars').hide();
        $('#cars-heading').hide();
        $('#invoices').hide(); 
        $('#invoices-heading').hide();

    });

   Bookings.init();

});


