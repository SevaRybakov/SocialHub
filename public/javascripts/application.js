$(function(){
	//binding close buttons to close the popups
	$('.close').click( function(){
		$(this).parent().fadeOut(1000);
	});
});