$(document).ready(function(){
	var clip = new ZeroClipboard($(".clip_button"));
	$(".clip_button").click(function() {
		clip = new ZeroClipboard($(".clip_button"));
    	Materialize.toast(
			"Link copied to Clipboard",
    		2000, "white black-text rounded"
		);
  	});
});