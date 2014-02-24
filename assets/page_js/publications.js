$(document).ready(function() {
  $("#scrolling-nav-div").hide()
  $(".publication-expand").hide();
  //toggle the componenet with class msg_body
  $(".publication-item").click(function(){
  	$(this).toggleClass('active-publication')
    $(this).next(".publication-expand").slideToggle(400);
    $('html,body').animate({
   		scrollTop: $(this).next(".publication-expand").offset().top -100
	});
  });
});