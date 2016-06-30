$(document).ready(function() {

 $(".completion-checkbox").on("click", function(e) {
  e.preventDefault();
 	var $target = $(e.target);
  var task_id = $target.parent().attr("action").split("/")[2];
  var url = "/tasks/" + task_id
 	var a = $.ajax({
 		method: "get",
 		url: url
  }).done(function(r) {
    $target.prepend(r);
 	});
});
});

