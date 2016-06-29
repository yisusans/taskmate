$(document).ready(function(){

  $("#completed_checkbox").click(function(){
    $(".new_completion").submit();
  });
});

$(".new_completion").on("submit", function(event){
	    event.preventDefault();
		$.ajax({
			url: '/completions/new',
			type: "post",
			dataType: "html"
		}).done(function(response){
			$('#assignments_container').prepend(response)
		})


});
