$(document).ready(function(){
	
	$("#invite-form").on("submit", function(e){
		e.preventDefault();
		var $target = $(event.target)
		$.ajax({
			method: "post",
			url: $target.attr("action"),
			data: $target.serialize();
		}).done(
			$("#invite-error").html("Invitation sent!")
		).error(function(err){
			debugger
			$("#invite-error").html("Invitation sent!")

		})
	});
});
