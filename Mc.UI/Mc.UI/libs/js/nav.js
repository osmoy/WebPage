$(function(){
	$(".navitem").hover(function() {
		$("div", this).stop().css("height",300).slideDown(100);
		$("#moved").stop().animate({
			left: $(this).position().left+$("#navc li").width()/2-30
		},
		400,"easeOutElastic")
	},
	function() {
		$("div", this).stop().delay(100).slideUp(200);
		$("#moved").stop().animate({
			left: $("#navactive").position().left+ $("#navactive").width()/2-30
		},
		300)
	});
	$("#navc li div").each(function(index, element) {
        $(this).data("theight",$(this).height());
    });
	$("#moved").css("left", $("#navactive").position().left+ $("#navactive").width()/2-30);
	
	$("#ichnav ul li:not(#inmoved)").hover(function() {
		if($(this).attr("id")=="inactive")return;		
		var obj=$("a",this);
		$("#inmoved").stop().animate({left:$(this).position().left},500,"easeOutBounce",function(){
			//obj.css("color","#858585").stop().animate({"color":"#ffffff"},300);
		});
		obj.css("color","#858585").stop().animate({"color":"#ffffff"},300);
		$("#inactive a").css("color","#5d5d5d");		
	},
	function() {
		if($(this).attr("id")=="inactive")return;

		$("#inmoved").stop().animate({left:$("#inactive").position().left},300,"",function(){$("#inactive a").css("color","#fff");});
		$("a",this).css("color","#5d5d5d").stop();
	});
	



})
