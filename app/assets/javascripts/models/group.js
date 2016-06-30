var Group = function(params) {
  params = params || {}
  this.name = params.name || "Group";
  this.users = params.users || [];
  this.tasks = params.tasks || [];
  this.invites = params.invites || [];
  this.conversation = params.conversation || null;
};

$(document).ready(function(){
	$(".foo").on('click', function(e){
		e.preventDefault();
		$target = $(event.target)
		$.ajax({
			method: "get",
			url: $target.attr('href')
		}).done(function(msg){
			if ($("#group-members").html().length === 0 ){
				$("#group-members").prepend(msg)
			} else {
				$("#group-members").html("")
			}
		});
	});
}); 
