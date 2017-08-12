<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String path = request.getContextPath(); // /bbs
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">



<link rel="stylesheet" type="text/css" href="js/easyui15/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui15/themes/icon.css">
<script type="text/javascript" src="js/easyui15/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui15/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui15/jquery.edatagrid.js"></script>