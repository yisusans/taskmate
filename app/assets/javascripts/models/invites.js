$(document).ready(function(){
	
	$("#invite-form").on("submit", function(e){
		e.preventDefault();
		var $target = $(event.target)
		$.ajax({
			method: "post",
			url: $target.attr("action"),
			data: $target.serialize()

		}).done(function(){
			$("#invite-error").prepend("Invitation sent!")
			
		}).error(function(err){
			// debugger
			$("#invite-error").prepend(err.responseText)
			})
	});
})
