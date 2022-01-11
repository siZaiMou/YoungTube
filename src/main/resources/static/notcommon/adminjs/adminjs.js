

var newnext2=0;
var newnext3=0;
var newnext=0;
$(document).ready(
		function() {
				//隐藏
			$("#div2").hide();
/*			$("#div2").hide();
			function asjdh() {//移出
	          	//alert("1");
        		$("#div2").hide();
	      	  }
	        function project() {//移入
	        	//alert("2");
	        	$("#div2").show();
	      	  }*/
	        
			var html = "";
			$.post("ajaxTuiJian3", { newnextvideo: 0 },function(test) {
				var ht = eval("(" + test + ")");
				var i = 0;
				$.each(ht, function(index, m) {
					html += "<li class='item'><a href='video.sf?dizhi="
							+ m.videoAddress + "&shipingID=" + m.videoID
							+ "'><i class='n2'>"+(++i)+"</i>" + m.videoName
							+ "</a></li>";
                    newnext3++;
				});
				// alert(html);
				$("#did4").html(html);
				html = "";
			});
			$.post("ajaxTuiJian2",{ newnextvideo: 0 }, function(test) {
				var ht = eval("(" + test + ")");
				var i=0;
				$.each(ht, function(index, m) {
					html += "<li class='item'><a href='video.sf?dizhi="
							+ m.videoAddress + "&shipingID=" + m.videoID
							+ "'><i class='n2'>"+(++i)+"</i>" + m.videoName
							+ "</a></li>";
                    newnext2++;
				});
				// alert(html);
				$("#did3").html(html);
				html = "";
			});
			$.post("ajaxTuiJian",{ newnextvideo: 0 }, function(test) {
				 var i=0;
				var ht = eval("(" + test + ")");
				$.each(ht, function(index, m) {
					html += "<li class='item'><a href='video.sf?dizhi="
							+ m.videoAddress + "&shipingID=" + m.videoID
							+ "'><i class='n2'>"+(++i)+"</i>" + m.videoName
							+ "</a></li>";

                    newnext++;
				});
				// alert(html);
				$("#did2").html(html);
				html = "";
			});

			$("#qiulingyang").click(function() {
				alert("你点我也没用啊! 神经病  瞄~");
			})
			// $("#shuaxin").click(function() {
			// 	alert("数据库视频不够... 神经病  瞄~");
			// })
			// $("#shuaxin1").click(function() {
			// 	alert("数据库视频不够... 神经病  瞄~");
			// })
			// $("#shuaxin2").click(function() {
			// 	alert("数据库视频不够... 神经病  瞄~");
			// })

		});

function asjdh() {//移出
  	//alert("1");
	$("#div2").hide();
	  }
function project() {//移入
	//alert("2");
	$("#div2").show();
	  }


window.onload = function() {
	document.getElementById('chakan4').onclick = function() {
		this.disabled = true;
		var html = "";
		var i = newnext3;
		// 向后台ajax
		$.post("ajaxTuiJian3",{ newnextvideo: newnext3 }, function(test) {
			var ht = eval("(" + test + ")");
			$.each(ht, function(index, m) {
				html += "<li class='item'><a href='video.sf?dizhi="
						+ m.videoAddress + "&shipingID=" + m.videoID
						+ "'><i class='n2'>"+(++i)+"</i>" + m.videoName + "</a></li>";
			  newnext3++;
			});
			// alert(html);
			$("#did4").html(html);
			html = "";
		});
		x = document.getElementById("chakan4");
		x.innerHTML = "正在刷新....";
		setTimeout(function() {
			x = document.getElementById("chakan4");
			x.innerHTML = "查看更多";
			document.getElementById('chakan4').disabled = false;
		}, 0);

	}
	document.getElementById('chakan3').onclick = function() {
		this.disabled = true;
		var html = "";
		var i=newnext2;
		// 向后台ajax
		$.post("ajaxTuiJian2", { newnextvideo: newnext2 },function(test) {
			var ht = eval("(" + test + ")");
			$.each(ht, function(index, m) {
				html += "<li class='item'><a href='video.sf?dizhi="
						+ m.videoAddress + "&shipingID=" + m.videoID
						+ "'><i class='n2'>"+(++i)+"</i>" + m.videoName + "</a></li>";
			newnext2++;
			});
			// alert(html);
			$("#did3").html(html);
			html = "";
		});
		x = document.getElementById("chakan3");
		x.innerHTML = "正在刷新....";
		setTimeout(function() {
			x = document.getElementById("chakan3");
			x.innerHTML = "查看更多";
			document.getElementById('chakan3').disabled = false;
		}, 0);

	}

	document.getElementById('chakan').onclick = function() {
		this.disabled = true;
		var html = "";
		// 向后台ajax
		$.post("ajaxTuiJian",{ newnextvideo: newnext }, function(test) {
			var ht = eval("(" + test + ")");
			var i=newnext;
			$.each(ht, function(index, m) {
				html += "<li class='item'><a href='video.sf?dizhi="
						+ m.videoAddress + "&shipingID=" + m.videoID
						+ "'><i class='n2'>"+(++i)+"</i>" + m.videoName + "</a></li>";
			newnext++;
			});
			// alert(html);
			$("#did2").html(html);
			html = "";
		});
		x = document.getElementById("chakan");
		x.innerHTML = "正在刷新....";
		setTimeout(function() {
			x = document.getElementById("chakan");
			x.innerHTML = "查看更多";
			document.getElementById('chakan').disabled = false;
		}, 0);

	}


    $("#shuaxin").click(function() {
        this.disabled = true;
        var html = "";
        var i = 0;
        // 向后台ajax
        $.post("/bilibili/shuaxin",{ videotype: 1 }, function(test) {
            var ht = eval("(" + test + ")");
            $.each(ht, function(index, m) {
                html += "<li class='item'><a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+ "' class= 'img-link'> <img src='/bilibili"+m.videoImage+"' alt='#'> <span class='mask'></span> <span class='time'>"+m.videoTime+"</span> </a><div class='img-info'> <a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+"'>"+m.videoName+"</a> <div class='btm'><div class='user'> <i></i>"+m.userMingzi+"</div> <div class='online'> <i></i>"+m.videolookTime+"</div> </div> </div></li>";

            });
            // alert(html);
            $(".list1").html(html);
            html = "";
        });
        x = document.getElementById("#shuaxin");
        x.innerHTML = "正在刷新....";
        setTimeout(function() {
            x = document.getElementById("#shuaxin");
            x.innerHTML = "刷新动态";
            document.getElementById('#shuaxin').disabled = false;
        }, 2000);

    });


    $("#shuaxin1").click(function() {
        this.disabled = true;
        var html = "";
        var i = 0;
        // 向后台ajax
        $.post("/bilibili/shuaxin",{ videotype: 2 }, function(test) {
            var ht = eval("(" + test + ")");
            $.each(ht, function(index, m) {
                html += "<li class='item'><a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+ "' class= 'img-link'> <img src='/bilibili"+m.videoImage+"' alt='#'> <span class='mask'></span> <span class='time'>"+m.videoTime+"</span> </a><div class='img-info'> <a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+"'>"+m.videoName+"</a> <div class='btm'><div class='user'> <i></i>"+m.userMingzi+" </div> <div class='online'> <i></i>"+m.videolookTime+"</div> </div> </div></li>";

            });
            // alert(html);
            $(".list2").html(html);
            html = "";
        });
        x = document.getElementById("#shuaxin1");
        x.innerHTML = "正在刷新....";
        setTimeout(function() {
            x = document.getElementById("#shuaxin1");
            x.innerHTML = "刷新动态";
            document.getElementById('#shuaxin1').disabled = false;
        }, 2000);

    });

    $("#shuaxin2").click(function() {
        this.disabled = true;
        var html = "";
        var i = 0;
        // 向后台ajax
        $.post("/bilibili/shuaxin",{ videotype: 3 }, function(test) {
            var ht = eval("(" + test + ")");
            $.each(ht, function(index, m) {
                html += "<li class='item'><a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+ "' class= 'img-link'> <img src='/bilibili"+m.videoImage+"' alt='#'> <span class='mask'></span> <span class='time'>"+m.videoTime+"</span> </a><div class='img-info'> <a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+"'>"+m.videoName+"</a> <div class='btm'><div class='user'> <i></i>"+m.userMingzi+" </div> <div class='online'> <i></i>"+m.videolookTime+"</div> </div> </div></li>";

            });
            // alert(html);
            $(".list3").html(html);
            html = "";
        });
        x = document.getElementById("#shuaxin2");
        x.innerHTML = "正在刷新....";
        setTimeout(function() {
            x = document.getElementById("#shuaxin2");
            x.innerHTML = "刷新动态";
            document.getElementById('#shuaxin2').disabled = false;
        }, 2000);

    });

    var tjnum=0;

    $(".btn-prev").click(function() {
        this.disabled = true;
        var html = "";
        var i = 0;
        // 向后台ajax
        $.post("/bilibili/tj",{ "tjnum": tjnum }, function(test) {
            var ht = eval("(" + test + ")");
            $.each(ht, function(index, m) {
                html += "<li><a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+"'> <img src='"+"/bilibili"+m.videoImage+"' alt='#'> <div class='info'> <p class='title'>"+m.videoName+"</p> <p class='author'>up主:"+m.userMingzi+"</p> <p class='play'>播放："+m.videolookTime+"</p> </div> </a></li>";
             tjnum++;
            });
            // alert(html);
            $("#toptj").html(html);
            html = "";
        });



    });


    $(".btn-next").click(function() {
        this.disabled = true;
        var html = "";
        var i = 0;
        // 向后台ajax
        $.post("/bilibili/tj",{ "tjnum": tjnum }, function(test) {
            var ht = eval("(" + test + ")");
            $.each(ht, function(index, m) {
                html += "<li><a href='video.sf?dizhi="+m.videoAddress+"&shipingID="+m.videoID+"'> <img src='"+"/bilibili"+m.videoImage+"' alt='#'> <div class='info'> <p class='title'>"+m.videoName+"</p> <p class='author'>up主："+m.userMingzi+"</p> <p class='play'>播放："+m.videolookTime+"</p> </div> </a></li>";
                tjnum++;
            });
            // alert(html);
            $("#toptj").html(html);
            html = "";
        });

    });















    }
