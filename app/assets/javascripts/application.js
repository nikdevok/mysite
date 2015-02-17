// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD

//= require all
//= require albums
//= require froala_editor.min.js
//= require plugins/block_styles.min.js
//= require plugins/colors.min.js
//= require plugins/media_manager.min.js
//= require plugins/tables.min.js
//= require plugins/video.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/file_upload.min.js
//= require plugins/lists.min.js
//= require plugins/char_counter.min.js
//= require langs/ru.js
//= require upload.js




$(document).ready(function() {
    $("a.group").fancybox({
                'hideOnContentClick': true,
                'transitionIn' : 'elastic',
                'transitionOut' : 'elastic'
      });

    $("input#photo-upload").on("change", function(){
       $("form#photo-upload-form").submit();
    });


    $("a.get_pwd").on("click", function(e){
        e.preventDefault();
        var pwd = generatepass(8);
        $("input#user_password, input#user_password_confirmation").val(pwd);
        $("span#get_pwd").text(pwd);
    });

    $(document).ready(function(){
        setTimeout(function(){
            $('.alert').fadeOut(1000, function(){
                $(this).remove();
            });
        }, 3000);

    })
    $(".eMessage > table").addClass("table table-bordered");
    $("#content > table > tbody > tr > td > div.eMessage > table > tbody > tr:nth-child(1) td").css('background', '#eee');

});


var keylist="abcdefghijklmnopqrstuvwxyz123456789";
var temp='';

function generatepass(plength){
    temp='';
    for (i=0;i<plength;i++)
        temp += keylist.charAt(Math.floor(Math.random()*keylist.length));
    return temp;
}


function date_time(id)
{
    date = new Date;
    year = date.getFullYear();
    month = date.getMonth();
    months = new Array('Января', 'Февраля', 'Марта', 'Апреля', 'Мая', 'Июня', 'Июля', 'Августа', 'Сентября', 'Октября', 'Ноября', 'Декабря');
    d = date.getDate();
    day = date.getDay();
    days = new Array('Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота');
    h = date.getHours();
    if(h<10)
    {
        h = "0"+h;
    }
    m = date.getMinutes();
    if(m<10)
    {
        m = "0"+m;
    }
    s = date.getSeconds();
    if(s<10)
    {
        s = "0"+s;
    }
    result = 'Сегодня '+ d + ' ' + months[month] + ', ' + days[day]+', '+h+':'+m;
    document.getElementById(id).innerHTML = result;
    setTimeout('date_time("'+id+'");','1000');
    return true;
}

