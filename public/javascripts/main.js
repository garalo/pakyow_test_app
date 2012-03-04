$(document).ready(function() {
    $('input[type=email]').focus(function(){
      $(this).val('');
      $(this).animate({"opacity": "1.0"}, "slow");
    });

    $("#dummy_password_field").focus(function(){
      $(this).hide();
      $("#password_field").show();
      $("#password_field").animate({"opacity": "1.0"}, "slow");
      $("#password_field").focus();
    });

    $("#dummy_password_confirmation_field").focus(function(){
      $(this).hide();
      $("#password_confirmation_field").show();
      $("#password_confirmation_field").animate({"opacity": "1.0"}, "slow");
      $("#password_confirmation_field").focus();
    });
    
    if($("#nav_list").hasClass('show'))
        $("#nav_list").fadeIn(2000)
});

