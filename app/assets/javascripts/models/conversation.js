$(document).ready(function() {
  if ( $( ".messages-container" ).length ) {
    $(".messages-container").animate({ scrollTop:$(".messages-container")[0].scrollHeight}, 1000);
  };
});
