var Group = function(params) {
  params = params || {}
  this.name = params.name || "Group";
  this.users = params.users || [];
  this.tasks = params.tasks || [];
  this.invites = params.invites || [];
  this.conversation = params.conversation || null;
};

$(document).ready(function(){
 $(".foo").on("click", function(e){
 	debugger;
 	e.preventDefault();
 	var $target = $(event.target)
 	$target.append(data)
 	});
});
