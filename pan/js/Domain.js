$.ajax({
    url: 'https://dt.pan.bufeifan.top',
    dataType: "jsonp",
    type: 'GET',
    complete: function (response) {
        if (response.status == 200) {
            window.location.href = "https://local.pan.bufeifan.top/n.html";
        } else {
			window.location.href = "/index.html"
        }
    }
});
setTimeout(function () {
    window.location.href = "/index.html"
}, 1000)