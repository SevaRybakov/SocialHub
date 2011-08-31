$(function(){
	//Making close buttons to close popups.
	$(".close").click( function(){
		$(this).parent().fadeOut(1000);
	});
	
	//Tab control.
	$('.tab-content').hide();
	$('ul.tabs li:first').addClass('active');
	$('.tab-content:first').show();
	
	$('ul.tabs li a').click( function(){
		$('ul.tabs li').removeClass('active');
		$(this).parent().addClass('active');
		$('.tab-content').hide();
		
		var tabToShow = $(this).attr('href');
		$(tabToShow).fadeIn(200);
		return false;
	});
});