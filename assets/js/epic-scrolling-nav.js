/*
    Get the data needed...
*/
$(function() {
  scrollerLinks = []
  $('.scrolling-nav-list').find('li').each(function() {
    scrollerLinks.push($(this));
  });
  anchor_names = []
  anchor_pos = []

  for(var i = 0, l=document.anchors.length; i<l; i++) {
    anchor_names.push(document.anchors[i].name);
    anchor_pos.push(document.anchors[i].offsetTop);
  }

  //Get the total height of the document:
  //http://james.padolsey.com/javascript/get-document-height-cross-browser/
  fullHeight = Math.max($(document).height(), $(window).height(), document.documentElement.clientHeight);

  anchor_pos.push(fullHeight);

});

/*
Scrolling Functions
*/
$(window).scroll(function() {
  var pos = $(this).scrollTop();

  for (var i=0; i<anchor_pos.length-1; i++){
    scrollerLinks[i].removeClass("active");
    if (pos > anchor_pos[i]-1 && pos < anchor_pos[i+1]){
      scrollerLinks[i].addClass("active");
    }
  }
  //Determine if navbar-scoller will be shown
  if (pos > 100) { //
    $("#scrolling-nav-div").fadeIn(300);
  }else{
    $("#scrolling-nav-div").hide()
  }
});

$('a').click(function(){
    $('html, body').animate({
        scrollTop: $( $(this).attr('href') ).offset().top
    }, 500);
    return false;
});