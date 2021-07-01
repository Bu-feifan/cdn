$.ajax({
    url: 'https://dt.pan.bufeifan.top',
    dataType: "jsonp",
    type: 'GET',
    complete: function (response) {
        if (response.status == 200) {
            window.location.href = "https://local.pan.bufeifan.top/home-u.html";
        } else {
			window.location.href = "https://local.pan.bufeifan.top/home-u.html";
        }
    }
});
setTimeout(function () {
    window.location.href = "/home-n.html"
}, 1000)