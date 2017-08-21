var console = console || {
    log:function(){},
    warn:function(){},
    error:function(){}
};


var $=jQuery.noConflict();


$(window).scroll(function(){ 
	var menu1 = $('.idx_guide').offset().top;
	var menu2 = $('.idx_care').offset().top;
	var menu3 = $('.idx_size').offset().top;
	var menu4 = $('.idx_order').offset().top;
	
	var scrollPos = $(window).scrollTop();
	var margin = $('#headWrapper').outerHeight()+100;

	if(scrollPos >= (menu1 - margin) && scrollPos <= (menu2 - margin)) {
		$('.gnb ul li a').removeClass('on');
		$('.gnb ul li a').removeClass('on2');
		$('.gnb ul li:eq(0) a').addClass('on');
	} else if(scrollPos >= (menu2 - margin) && scrollPos <= (menu3 - margin)) {
		$('.gnb ul li a').removeClass('on');
		$('.gnb ul li a').removeClass('on2');
		$('.gnb ul li:eq(1) a').addClass('on');
	} else if(scrollPos >= (menu3 - margin) && scrollPos <= (menu4 - margin)) {
		$('.gnb ul li a').removeClass('on');
		$('.gnb ul li a').removeClass('on2');
		$('.gnb ul li:eq(2) a').addClass('on');
	} else if(scrollPos >= (menu4 - margin)) {
		$('.gnb ul li a').removeClass('on');
		$('.gnb ul li:eq(3) a').addClass('on2');
	}
});


$(document).ready(function() {

	$('#idxSlide').bxSlider({
		'auto':true,
		'controls':false,
		'touchEnabled':false
	});
	$('.gnb ul li a, #idxSlide a, .guidein a.scroll').on('click', function(event) {
		event.preventDefault();
		var link = $(this).attr('href');
		var margin = $('#headWrapper').outerHeight() - 1;
		
		$('html,body').animate({scrollTop:($(link).offset().top - margin)}, 500);
	});

});
