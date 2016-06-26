$(document).ready(function(){

  $(".button-collapse").sideNav({
    edge: 'left',
    closeOnClick: true 
  });

  $(".dropdown-button").dropdown(
  		{
  		  constrain_width: false,
  		  hover :true,
  	      belowOrigin: true
  		}
  	);
});