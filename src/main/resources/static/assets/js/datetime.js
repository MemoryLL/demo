$(function () {
    setInterval("getTime();", 1000); //每隔一秒运行一次
});
//取得系统当前时间
function getTime() {
    var myDate = new Date();
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();
    var weekday = myDate.getDay();
    var weekdayCh = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    var hours = myDate.getHours();
    var minutes = myDate.getMinutes();
    if (day < 10) {
        day = "0" + day;
    }

    if (hours < 10) {
        hours = "0" + hours;
    }

    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    $("#dateTime").html(year + "年" + month + "月" + day + "日" + " " + weekdayCh[weekday] + " " + hours + ":" + minutes);
}