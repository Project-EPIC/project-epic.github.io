$(document).ready(function() {

  //Be sure to hide all the descriptions
  $(".publication-expand").hide();
  
  //Hide the subnav
  $("#scrolling-nav-div").hide()

  //Assign a Waypoint to it
  $("#scrolling-nav-div").waypoint(function() {
    $("#scrolling-nav-div").show(1000);
  }, { offset: 0});


  //Now add the logic to each element in the list:
  $(".sub-nav-list-item").each(function( index ) {
      
      var link = $('a',this).attr('href');
      
      $(link).waypoint(function(index){
        $(".sub-nav-list-item").removeClass("active")
        $(this).toggleClass('active')
      },{offset: 100})

      $(this).click(function(){
        $('html,body').animate({scrollTop: $(link).offset().top-150}, 'medium');
      })      
    });


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