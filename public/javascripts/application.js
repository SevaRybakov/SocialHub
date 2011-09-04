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

  $(function() {
    if($('#posts').length > 0 ) {
      setTimeout(updatePosts, 5000)
    }
  })

  function updatePosts() {
    var created_at = $(".post:first-child").attr("posttime");
    $.getScript(window.location.href + "/posts" + "?created_at=" + created_at + "&status=new")
    setTimeout(updatePosts, 5000)
  }


  $('#post_content').keyup(checkPostContent);
  $('#status_checkbox').change(checkPostContent);

  function checkPostContent() {
    if ( $('#status_checkbox').attr('checked') && $('#post_content').val().length > 20 ) {
      $('#post_submit').addClass('disabled');
      $('#status_alert').remove();
      $('.clearfix').append("<p id=\"status_alert\" style=\"color: red; text-align: center;\">Status cannot be more than 256 symbols!</p>");
    } else {
        $('#status_alert').remove();
        $('#post_submit').removeClass('disabled');
    }
  }

});

