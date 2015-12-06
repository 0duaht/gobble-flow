$(document).ready(function(){
	new ZeroClipboard($(".clip_button"));
	$(".clip_button").click(function() {
    	Materialize.toast(
			"Link copied to Clipboard",
    		2000, "white black-text rounded"
		);
  	});
});