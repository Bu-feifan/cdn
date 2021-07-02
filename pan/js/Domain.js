function getReferer(){return!!document.referrer&&document.referrer}
function prompt(n){var t=n;return 1==new RegExp(/local.pan.bufeifan.top|192.168.0.104|dt.pan.bufeifan.top/).test(t)}
true==prompt(getReferer())&&(window.location.href="https://local.pan.bufeifan.top/n.html")
$.ajax({
    url: 'https://dt.pan.bufeifan.top',
    dataType: "jsonp",
    type: 'GET',
    complete: function (response) {
        if (response.status == 200) {
            window.location.href = "https://local.pan.bufeifan.top/r.html";
        } else {
			window.location.href = "/index.html"
        }
    }
});
setTimeout(function () {
    window.location.href = "/index.html"
}, 1000)