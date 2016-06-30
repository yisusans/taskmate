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
			$("#invite-message").prepend("<div class='col s12 m6'> <div class='card red lighten-3'><div class='card-content white-text'>" + resp.responseText + "</div></div></div>")
		}).error(function(err){
			$("#invite-message").html("")
			$("#invite-message").prepend("<div class='col s12 m6'> <div class='card red lighten-3'><div class='card-content white-text'>" + err.responseText + "</div></div></div>")
			$("#invite_invitee").val("")
			})
	});
})
