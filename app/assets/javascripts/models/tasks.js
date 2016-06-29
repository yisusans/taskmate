$(document).ready(function(){

 $(".foo").on("click", function(e){
 	e.preventDefault();
 	var $target = $(event.target)
 	$.ajax({
 		method: "post",
 		url: $target.parent().attr("action"),
 		data: $target.parent().serialize(),
 	}).done( function(resp){
		$('#completed_checkbox').prop('checked', true);
		$('#assignments_container').prepend(resp)
 	})
 	// $target.parent().submit().bind( function(resp){
		// debugger
		// $('#assignments_container').prepend(response)
 		
 	// })
 	// .done( function(resp){
 	// })
 })

  //   $().submit(function(){
  // click(function(){
  //   }).done(function(response) {
		// 	debugger;
  //   		console.log(response)
  //   })
	 //    event.preventDefault();
		// $.ajax({
		// 	url: '/completions/new',
		// 	type: "post",
		// 	dataType: "html"
		// }).done(function(response){
		// 	$('#assignments_container').prepend(response)
		// })
  });
// });



// $(".new_completion").on("submit", function(event){
// 	    event.preventDefault();
// 		$.ajax({
// 			url: '/completions/new',
// 			type: "post",
// 			dataType: "html"
// 		}).done(function(response){
// 			debugger;
// 			$('#assignments_container').prepend(response)
// 		})


// });
