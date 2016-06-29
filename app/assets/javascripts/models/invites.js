$(document).ready(function(){
	
	$("#invite-form").on("submit", function(e){
		e.preventDefault();
		var $target = $(event.target)
		$.ajax({
			method: "post",
			url: $target.attr("action"),
			data: $target.serialize()

		}).done(function(resp){
			$("#invite-message").html("")
			$("#invite-message").prepend(resp.responseText)
		}).error(function(err){
			$("#invite-message").html("")
			$("#invite-message").prepend(err.responseText)
			$("#invite_invitee").val("")
			})
	});
})
