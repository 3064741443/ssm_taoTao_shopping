<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
	$("#addBtn").click(function(){
		//异步请求
		$.ajax({
				type:"POST",
				url:"back/newsType.action",
				data:$("#addNewsTypeForm").serialize(),
				dataType:"json",//替换eval
				success:function(data){
					if(data.code==1){
						$.messager.alert('Waring','添加成功');
					}else{
						$.messager.alert('Waring','添加失败'+data.errorMsg);
					}
				}
			});
		});
	});


</script>


<title>新增类别</title>
</head>
<body>
		<form id="addNewsTypeForm" action="back/newsType.action" method="post">
			<input type="hidden" name="op" value="add">
		新闻类别： <input type="text" name="tname"  /><br>
		<input type="button" id="addBtn" value="添加">
	</form>
</body>
</html>