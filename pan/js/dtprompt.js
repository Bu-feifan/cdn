$.ajax({
    url: 'https://dt.pan.bufeifan.top',
    dataType: "jsonp",
    type: 'GET',
    complete: function (response) {
        if (response.status == 200) {
            document.getElementById("prompt").innerHTML = "当前网络为内网,即服务器所在局域网";
        } else {
			document.getElementById("prompt").innerHTML = "当前网络为内网,即服务器所在局域网";
        }
    }
});