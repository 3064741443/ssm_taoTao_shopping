<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<script type="text/javascript">
		$(function(){
			$('#manTypeTable').edatagrid({
				url:'back/newsType.action?op=findAll',//查询时候加载url
				pagination:true,//显示分页
				pageSize:50,//默认的每页条数
				title:"新闻类别管理",
				idField:"tid",//标识   会记录我们选中的一行的ID  不一定是ID  通常为主键
				rownumbers:"true",//显示行号
				nowwrap :"true",//不换行显示
				sortName:"tid",//排序的列  这个参数会传到后台的servlet上  所以要有后台对应接受
				sortOrder:"desc",//排序方式
				singleSelect:true,
				//以上的四种增删改查操作  只要失败  都会调用这个onError
				onError:function(a,b){
					$.message.alert("错误","操作失败");
				},
				columns:[[{
					field:'tid',	
					title:'新闻编号',
					width:100,
					align:'center',
					hidden:'true'
				},{
					field:'tname',	
					title:'新闻名',
					width:100,
					align:'center'
				},{
					field:'status',	
					title:'显示状态',
					width:100,
					align:'center'
				}]]
				
			});
		});
</script>



<title>添加新闻类别  </title>
</head>
<body>
				
	<table id="manTypeTable"></table>

</body>
</html>