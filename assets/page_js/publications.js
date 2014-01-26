$(document).ready(function() {
  $(".publication-expand").hide();
  //toggle the componenet with class msg_body
  $(".publication-item").click(function()
  {
    $(this).next(".publication-expand").slideToggle(500);
  });
});