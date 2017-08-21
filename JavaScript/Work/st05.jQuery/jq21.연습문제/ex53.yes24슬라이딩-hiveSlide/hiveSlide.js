/**
 * Created by Administrator on 2016-09-12.
 * http://www.yes24.com/JavaScript/hiveSlide.js?v=20140801
 */

(function($){

    $.fn.hiveslide = function(options){
        return this.each(function(){
            $.hiveslide(this, options);
        });
    };

    /* yes24 /javascript/dimensions.js 에서 충돌나서 디자인팀에서 재정의 시작 */
    function jdjNum(elem, prop) {
        return elem[0] && parseInt( jQuery.curCSS(elem[0], prop, true), 10 ) || 0;
    }

    $.each([ "Height", "Width" ], function(i, name){

        var tl = i ? "Left"  : "Top",  // top or left
            br = i ? "Right" : "Bottom"; // bottom or right

        // innerHeight and innerWidth
        jQuery.fn["jdjInner" + name] = function(){
            return this[ name.toLowerCase() ]() +
                jdjNum(this, "padding" + tl) +
                jdjNum(this, "padding" + br);
        };

        // outerHeight and outerWidth
        jQuery.fn["jdjOuter" + name] = function(margin) {
            return this["jdjInner" + name]() +
                jdjNum(this, "border" + tl + "Width") +
                jdjNum(this, "border" + br + "Width") +
                (margin ?
                jdjNum(this, "margin" + tl) + jdjNum(this, "margin" + br) : 0);
        };
    });
    /* yes24 /javascript/dimensions.js 에서 충돌나서 디자인팀에서 재정의 끝 */

    $.hiveslide = function(container, options){
        var settings ={
            auto : true, // 자동(auto) [기본값] / 비자동(false)
            type : 'default', // 배너타입 : default(기본) / fade(페이드인아웃) / slide(슬라이드)
            target : 'top', // 슬라이드 방향 : left(왼쪽) / right(오른쪽) / top(위쪽) / bottom(아래쪽)
            align : null, // 배너 방향
            play_time: 4500, // 시간
            speed : 250, // 스피드
            current : 0, // 시작하는 값
            prevcurrent : null, // 이전 current 값
            autoTimerId : null, // 자동롤링되는 변수
            obj : $(container), // 배너부모노드
            total_num : $(container).children().length, // 배너전체 개수
            obj_pic : $(container).children().find('a:first').next(), // 배너이미지
            banner_width : $(container).children().find('a:first').next().width(), // 배너이미지 넓이
            banner_height : $(container).children().find('a:first').next().height(), // 배너이미지 높이
            banner_dots : $(container).children().find('a:first'), // 배너 넘버링
            wraptag: false,
            moveEvent: function (obj, settings) { },
            stopEvent: function (obj, setting) { }
        };
        if(options){$.extend(settings, options);};
        var banner_slider = $(container).find('*') || $(container); // 마우스오버아웃효과 제어영역
        var prevbtn = $(container).parent().find('.prev a'); // 이전배너 보기버튼
        var nextbtn = $(container).parent().find('.next a'); // 다음배너 보기버튼

        if(settings.wraptag){
            settings.obj_pic = settings.banner_dots.parent().next();
            settings.banner_width = settings.banner_dots.parent().next().width();
            settings.banner_height = settings.banner_dots.parent().next().height();
        };

        // 효과 세팅하기
        settings.obj_pic.hide();

        // 처음 메뉴 보이는 위치
        settings.obj_pic.eq(settings.current).show();
        $.hiveslide.dots(settings, settings.current);
        settings.prevcurrent = settings.current;

        var outwidth = (settings.banner_dots.not(settings.banner_dots.eq(settings.current)).jdjOuterWidth(true) * settings.total_num) + ((settings.banner_dots.eq(settings.current).jdjOuterWidth(true))-(settings.banner_dots.not(settings.banner_dots.eq(settings.current)).jdjOuterWidth(true)));

        if(settings.align == 'center'){
            settings.obj.css({
                width : outwidth
            });
            settings.obj.css({
                margin : '0 auto'
            });
        }else if(settings.align == 'left'){
            settings.obj.css({
                width : outwidth
            });
            settings.obj.css({
                display : 'inline',
                float : 'left'
            });
        }else if(settings.align == 'right'){
            settings.obj.css({
                width : outwidth
            });
            settings.obj.css({
                display : 'inline',
                float : 'right'
            });
        };

        // 배너효과 시작
        if(settings.auto){
            if(settings.total_num > 1){
                setTimeout(function(){
                    $.hiveslide.autoplay(settings.obj_pic, settings, settings.current);
                }, 0);
            };
        };

        // 배너 메뉴에서 마우스가 오버되는 경우, 오버된 위치에 맞게 배너를 보이도록 하기.
        settings.banner_dots.bind("mouseover focus", function(){
            current = settings.banner_dots.index(this);
            $.hiveslide.effect(settings.obj_pic, settings, current);
        });

        // 이전배너 보이기 호출
        prevbtn.bind("click", function(){
            $.hiveslide.prev(settings.obj_pic, settings, settings.current);
            return false;
        });

        // 다음배너 보이기 호출
        nextbtn.bind("click", function(){
            $.hiveslide.next(settings.obj_pic, settings, settings.current);
            return false;
        });

        // 배너슬라이더에 마우스 커서가 들어오는 경우 자동실행 기능을 멈춘다.
        banner_slider.bind("mouseover focus", function(){
            if(settings.auto){
                $.hiveslide.stopplay(settings.autoTimerId, settings);
            };
        });

        // 배너슬라이더에서 마우스 커서가 밖으로 나가는 경우 다시, 자동실행 기능 시작.
        banner_slider.bind("mouseleave blur", function(){
            if(settings.auto){
                $.hiveslide.autoplay(settings.obj_pic, settings, settings.current);
            };
        });

        // 정지버튼을 클릭하면 자동실행 멈춤
        if(settings.stopbtn){
            settings.stopbtn.bind("click", function(){
                settings.auto = false;
                $.hiveslide.stopplay(settings.autoTimerId, settings);
                return false;
            });
        };

        // 실행버튼을 클릭하면 자동실행
        if(settings.playbtn){
            settings.playbtn.bind("click", function(){
                settings.auto = true;
                $.hiveslide.autoplay(settings.obj_pic, settings, settings.current);
                return false;
            });
        };
        // setting 값 보존
        $.hiveslide.saveData(settings);
    };

    // 이전배너 보이기 함수
    $.hiveslide.prev = function(elements, settings, current){
        current = settings.current-1; // 이동할 다음 배너 인덱스 값 구하기.
        // 다음 내용이 없는 경우, 첫 번째 배너 인덱스 값으로 설정하기.
        if(current < 0){
            current = settings.total_num-1;
        };
        $.hiveslide.effect(elements, settings, current); // n번째 배너 보이기.
    };

    // 다음배너 보이기 함수
    $.hiveslide.next = function(elements, settings, current){
        current = settings.current+1; // 이동할 다음 배너 인덱스 값 구하기.
        // 다음 내용이 없는 경우, 첫 번째 배너 인덱스 값으로 설정하기.
        if(current >= settings.total_num){
            current = 0;
        };
        $.hiveslide.effect(elements, settings, current); // n번째 배너 보이기.
    };

    // current에 해당하는 배너 보이기.
    $.hiveslide.effect = function(elements, settings, current){
        if(current != settings.current){
            if(settings.type == 'default'){
                elements.eq(settings.prevcurrent).hide();
                elements.eq(current).show();
                // 배너 메뉴의 위치 값을 업데이트 시킴.
                $.hiveslide.dots(settings, current, settings.prevcurrent);
                settings.prevcurrent = current;
            }else if(settings.type == 'fade'){
                elements.not(elements.eq(current)).stop(true,true).fadeOut(settings.speed);
                elements.eq(current).stop(true,true).fadeIn(settings.speed);
                // 배너 메뉴의 위치 값을 업데이트 시킴.
                $.hiveslide.dots(settings, current, settings.prevcurrent);
                settings.prevcurrent = current;
            }else if(settings.type == 'slide'){
                if(settings.target == 'left'){
                    var nPosition = -(settings.banner_width);
                    elements.clearQueue();
                    elements.css({
                        display: 'none',
                        zIndex : 0
                    });
                    elements.eq(settings.prevcurrent).css({
                        display: 'block'
                    });
                    elements.eq(current).css({
                        display: 'block',
                        zIndex : 10
                    });
                    if(current>settings.prevcurrent){
                        elements.eq(current).css({
                            left: settings.banner_width
                        });
                        elements.eq(settings.prevcurrent).animate({
                            left : nPosition
                        }, settings.speed);
                    }else{
                        elements.eq(current).css({
                            left: nPosition
                        });
                        elements.eq(settings.prevcurrent).animate({
                            left : settings.banner_width
                        }, settings.speed);
                    }
                    elements.eq(current).animate({
                        left : 0
                    }, settings.speed);
                }else if(settings.target == 'right'){
                    var nPosition = -(settings.banner_width);
                    elements.clearQueue();
                    elements.css({
                        display: 'none',
                        zIndex : 0
                    });
                    elements.eq(settings.prevcurrent).css({
                        display: 'block'
                    });
                    elements.eq(current).css({
                        display: 'block',
                        zIndex : 10
                    });
                    if(current>settings.prevcurrent){
                        elements.eq(current).css({
                            left: nPosition
                        });
                        elements.eq(settings.prevcurrent).animate({
                            left : settings.banner_width
                        }, settings.speed);
                    }else{
                        elements.eq(current).css({
                            left: settings.banner_width
                        });
                        elements.eq(settings.prevcurrent).animate({
                            left : nPosition
                        }, settings.speed);
                    }
                    elements.eq(current).animate({
                        left : 0
                    }, settings.speed);
                }else if(settings.target == 'top'){
                    var nPosition = -(settings.banner_height);
                    elements.clearQueue();
                    elements.css({
                        display: 'none',
                        zIndex : 0
                    });
                    elements.eq(settings.prevcurrent).css({
                        display: 'block'
                    });
                    elements.eq(current).css({
                        display: 'block',
                        zIndex : 10
                    });
                    if(current>settings.prevcurrent){
                        elements.eq(current).css({
                            top: settings.banner_height
                        });
                        elements.eq(settings.prevcurrent).animate({
                            top : nPosition
                        }, settings.speed);
                    }else{
                        elements.eq(current).css({
                            top: nPosition
                        });
                        elements.eq(settings.prevcurrent).animate({
                            top : settings.banner_height
                        }, settings.speed);
                    }
                    elements.eq(current).animate({
                        top : 0
                    }, settings.speed);
                }else if(settings.target == 'bottom'){
                    var nPosition = -(settings.banner_height);
                    elements.clearQueue();
                    elements.css({
                        display: 'none',
                        zIndex : 0
                    });
                    elements.eq(settings.prevcurrent).css({
                        display: 'block'
                    });
                    elements.eq(current).css({
                        display: 'block',
                        zIndex : 10
                    });
                    if(current>settings.prevcurrent){
                        elements.eq(current).css({
                            top: nPosition
                        });
                        elements.eq(settings.prevcurrent).animate({
                            top : settings.banner_height
                        }, settings.speed);
                    }else{
                        elements.eq(current).css({
                            top: settings.banner_height
                        });
                        elements.eq(settings.prevcurrent).animate({
                            top : nPosition
                        }, settings.speed);
                    };
                    elements.eq(current).animate({
                        top : 0
                    }, settings.speed);
                };
                // 배너 메뉴의 위치 값을 업데이트 시킴.
                $.hiveslide.dots(settings, current, settings.prevcurrent);
                settings.prevcurrent = current;
            };
            //현재 배너 인덱스 업데이트 시키기.
            settings.current = current;
        };
    };

    // 배너 메뉴의 위치값을 업데이트 시킴.
    $.hiveslide.dots = function(settings, current, prevcurrent){
        settings.banner_dots.eq(prevcurrent).parent().removeClass("on");
        settings.banner_dots.eq(current).parent().addClass("on");
    };

    // 자동실행
    $.hiveslide.autoplay = function (elements, settings, current) {
        settings.auto = true;
        if (settings.autoTimerId != 0) {

            $.hiveslide.fireStopEvent(this, settings);

            clearInterval(settings.autoTimerId);
        };


        settings.autoTimerId = setInterval(function () {
            $.hiveslide.fireMoveEvent(this, settings);
            $.hiveslide.next(elements, settings, current);
        }, settings.play_time);

        $.hiveslide.saveData(settings);
    };

    // 자동실행 멈춤.
    $.hiveslide.stopplay = function (autoTimerId, settings) {
        if (autoTimerId != 0) {
            $.hiveslide.fireStopEvent(this, settings);
            $.hiveslide.saveData(settings);

            clearInterval(autoTimerId);
        };
        autoTimerId = 0;
    };

    $.hiveslide.fireStopEvent = function (obj, settings) {

        if (settings.stopEvent != null)
            settings.stopEvent(this, settings);
    };

    $.hiveslide.fireMoveEvent = function (obj, settings) {
        if (settings.moveEvent != null)
            settings.moveEvent(this, settings);
    };

    $.hiveslide.saveData = function (settings) {
        $('#' + settings.obj[0].id).data('setting', settings);
    };

})(jQuery);

// **** remove Opacity-Filter in ie ****
function removeFilter(element){
    if(element.style.removeAttribute){
        element.style.removeAttribute('filter');
    };
}
