
"use strict";

MYAPP.Cookie = { name: '' };



MYAPP.Cookie.create = function(name, value, days, domain) {
    var expires = '';

    if( domain ){
        expires = '; path='+ domain ;
    }
    else {
        expires = '; path=/';
    }

    if(days) {
        var date = new Date();
        date.setDate( date.getDate() + parseInt( days ) );
        expires = expires + '; expires=' + date.toGMTString();
    }
    else {
        expires = '';
    }

    var oldcookie = this.find(name);

    if (oldcookie) {
        var newcookie = name +'=' + value;
        document.cookie.replace(oldcookie, newcookie);
    }
    else {
        // 쿠키 생성 : name=value; expries=13848347859595
        document.cookie = name +'=' + value + expires;
    }
};

MYAPP.Cookie.find = function(name) {
    var pattern = RegExp(name+'=.[^;]*');
    var matched = document.cookie.match( pattern );

    if( matched ) {
        return matched[0];
    }
    else {
        return false;
    }
};

MYAPP.Cookie.read = function(name) {

    var cookie = this.find(name);

    if( cookie ) {
        return cookie;
    }
    else {
        return false;
    }
};

MYAPP.Cookie.delete = function(name) {
    this.create(name, '', -1);
};


MYAPP.Cookie.update = function(name, value) {
    this.create(name, value, 0);
};




