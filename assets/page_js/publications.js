$(document).ready(function() {

  $("ul.scrolling-nav-list").click(function(){
    $(".publication-expand").hide(400);
  });

  //Be sure to hide all the descriptions
  $(".publication-expand").hide();

  //Handle the hiding / showing of abstracts
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