$(document).ready(function() {
  $(".publication-expand").hide();
  //toggle the componenet with class msg_body
  
  $(".publication-item").click(function(){
    if ($(this).next(".publication-expand").is(":visible")){
      //If it is visible, then remove the class & hide it
      $(this).removeClass('active-publication')
      $(this).next(".publication-expand").slideToggle(400);
    }
    else{
      //Hide all previous & remove the active class
      $(".publication-item").removeClass('active-publication')
      $(".publication-expand").hide(400);
      
      //Add active class to this and then show the slide
      $(this).addClass('active-publication')
      $(this).next(".publication-expand").slideToggle(400);
    }

  });

});