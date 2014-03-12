$(document).ready(function() {
  $("#scrolling-nav-div").hide()
  $(".news-expand").hide();
  //toggle the componenet with class msg_body
  $(".news-item").click(function(){
  	$(this).toggleClass('active-news')
    $(this).next(".news-expand").slideToggle(400);
    $('html,body').animate({
   		scrollTop: $(this).next(".news-expand").offset().top -100
	});
  });
});