/** jquery.highlight.js 
 *   
 */
(function( $ ){ // 여러분의 플러그인을 감싼다. 
    $.fn.highlight = function() {      
    	return this.each(function() {
    		// 여러분의 플러그인으로 동작할 로직을 기술할 자리이다. 
    		 var $element = $(this);
    		 $element.css('color', 'red')
    		         .css('background', 'yellow');    		
		});    	
    };
}) (jQuery);
