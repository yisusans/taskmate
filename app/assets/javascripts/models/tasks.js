$(document).ready(function(){

 $(".completion-checkbox").on("click", function(e){
 	e.preventDefault();
 	var $target = $(event.target)
 	$.ajax({
 		method: "post",
 		url: $target.parent().attr("action"),
 		data: $target.parent().serialize(),
 	}).done( function(resp){
		$('#completed_checkbox').prop('checked', true);
		$('#assignments_container').prepend(resp)
 	});
 	});
});
