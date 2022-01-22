/**
 * Created by Administrator on 2018/3/12.
 */
$(".imgface").click(function(e){//点击左下角的表情
    $(".face").slideDown();
    /*
     e.stopPropagation();
     定义和用法
         不再派发事件。
         终止事件在传播过程的捕获、目标处理或起泡阶段进一步传播。
         调用该方法后，该节点上处理该事件的处理程序将被调用，事件不再被分派到其他节点。
    说明:
        该方法将停止事件的传播，阻止它被分派到其他 Document 节点。
        在事件传播的任何阶段都可以调用它。
        注意，虽然该方法不能阻止同一个 Document 节点上的其他事件句柄被调用，但是它可以阻止把事件分派到其他节点。
    */
    e.stopPropagation();
});
$(document).click(function(){//点击任意位置 ，即文档
    $(".face").slideUp();
});
$(".face ul li").click(function(){
    var _img=$(this).find("img").clone();
    $(".edit").append(_img);//append() 方法在被选元素的结尾（仍然在内部）插入指定内容。即在每个 edit元素结尾插入内容：
});
$(".msg_but").click(function(){
    var _txt=$(".edit").html();//获取编辑的所有内容
    if(_txt == ""){
        $(".edit").focus();//获取焦点
    }
    else{
        //$(".msgBox").append("<div class='msgInfo'><dl><dt><img src='images/tz.jpg' /></dt><dd>风雨兼程</dd></dl><div class='con'>"+_txt+"</div></div>");
        $(".edit").html("");//清空内容
    }
});