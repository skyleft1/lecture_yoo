"use strict";

$(document).ready( function() {
    $('div[w3-include-header]').load( $('div[w3-include-header]').attr('w3-include-header') );
    $('div[w3-include-footer]').load( $('div[w3-include-footer]').attr('w3-include-footer') );

    // 찾기 버튼에 토글 달기
    $('body').on( 'click', '#btn1', function(e){
        $('#content').toggle();
    });
});
