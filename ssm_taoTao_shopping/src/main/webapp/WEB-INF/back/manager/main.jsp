<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>


<title>新闻管理系统后台欢迎您</title>
<script type="text/javascript">
//相当于
	$(function(){
		var treeData=[{
			"text":"商品管理",
			"state":"closed",
			"children":[{
				"text":"新增商品",
				"attributes":{
					//"url":"back/manager/newstype/addType.jsp"
				"url":"<iframe  width='100%' height='100%'  src='back/manager/newstype/addType.jsp'/>"
				}
			},{
				"text":"查询商品",
					"attributes":{
						//"url":"back/manager/newstype/mainType.jsp"
						"url":"<iframe width='100%' height='100%' src='back/manager/newstype/mainType.jsp'/>"
					}
			},{
				"text":"规格参数",
				"attributes":{
					//"url":"back/manager/newstype/addType.jsp"
				"url":"<iframe  width='100%' height='100%'  src='back/manager/newstype/addType.jsp'/>"
				}
			}]
	}];
		
		var treeDataNews=[{
			"text":"网站内容管理",
			"state":"closed",
			"children":[{
				"text":"内容分类管理",
				"attributes":{
					//"url":"back/manager/newstype/addType.jsp"
				"url":"<iframe  width='100%' height='100%'  src='back/manager/news/addType.jsp'/>"
				}
			},{
				"text":"内容管理",
					"attributes":{
						//"url":"back/manager/newstype/mainType.jsp"
						"url":"<iframe width='100%' height='100%' src='back/manager/news/manType.jsp'/>"
					}
			}]
		}];
		
		
	
		$("#newsTypeTree").tree({
			data:treeData, //将这里改成URL “”
			onClick:function(node){
				//alert(node.text);
				if(node.attributes){
					openTab(node);
				}
			}
		});
		
		$("#newsTree").tree({
			data:treeDataNews, //将这里改成URL “”
			onClick:function(node){
				//alert(node.text);
				if(node.attributes){
					openTab(node);
				}
			}
		});
		
		
	});
	function openTab(node){
		if($("#mainTt").tabs("exists",node.text)){
			$("#mainTt").tabs("select",node.text);
		}else{
			$("#mainTt").tabs("add",{
				title:node.text,
				selected:true,
				close:true,
				tools:[{
					iconCls:'icon-cancel',
					handler:function(){alert('save')}
				}],
				//href:node.attributes.url
				content:node.attributes.url
			})
		}
	}
</script>
</head>

<body class="easyui-layout layout panel-noscroll">

	<div data-options="region:'north'" style="height: 50px">top</div>

	<div data-options="region:'south',split:true" style="height: 50px;">button</div>
	<div data-options="region:'east',split:true" title="East"
		style="width: 100px;">右lp</div>

	<div data-options="region:'west',split:true" title="West"
		style="width: 150px;">
		
		<div class="easyui-accordion" style="width: 500px; height: 300px;">
		
		
		
			<div title="商品管理" style="overflow: auto; padding: 10px;">
				<div class="easyui-panel" style="padding:5px">
					<ul id="newsTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>				
				</div>
			</div>
				
				
				
				
			<div title="网站内容管理" style="overflow: auto; padding: 10px;">
				<div class="easyui-panel" style="padding:5px">
					<ul id="newsTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>				
				</div>				
			</div>
			<div title="数据字典" style="overflow: auto; padding: 10px;">数据字典</div>
			<div title="系统备份还原" style="overflow: auto; padding: 10px;">
				系统备份还原</div>
			<div title="权限管理" style="overflow: auto; padding: 10px;">权限管理</div>
		</div>
		
	</div>

	<div data-options="region:'center',title:'主操作区',iconCls:'icon-ok'">
		<!-- tabs区  有很多的tab -->
		<div id="mainTt" class="easyui-tabs" data-options="fit:true,board:false" >
			<div title="待处理业务区">欢迎您,元辰信息</div>
		</div>

	</div>

</body>
</html>