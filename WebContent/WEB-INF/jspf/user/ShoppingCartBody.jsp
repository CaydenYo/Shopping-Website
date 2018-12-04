<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	td{
		text-align: center;
	}
</style>
<link rel="stylesheet" type="text/css" media="screen" href="/EBP_19/css-table.css" />
<script type="text/javascript" src="/EBP_19/js/style-table.js"></script>

<table id="travel" border="1" cellspacing="0" style="margin-left: 5%;width: 90%;background:#edeff0;font-family: 'ambleregular'">
	<tr>
		<th>商品编号</th>
		<th>购物编号</th>
		<th>描述</th>
		<th>单价(元)</th>
		<th>购票数(张)</th>
		<th>总金额(元)</th>
		<th></th>
	</tr>
	<c:set var="sumMoney" scope="session" value="${0}"></c:set>
	<c:set var="sumTicket" scope="session" value="${0}"></c:set>
	<c:forEach items="${shoppingcartlist}" var="list1">
	<tr>
		<td width="10%;">${list1.tid  }</td>
		<td width="10%;">${list1.scid  }</td>
		<td width="30%;">${list1.descs }</td>
		<td width="10%;">${list1.price }</td>
		<td width="10%;" >${list1.quantity }</td>
		<td width="10%;" >${list1.quantity * list1.price }</td>
		<c:set var="sumTicket" scope="session" value="${sumTicket+list1.quantity}"></c:set>
		<c:set var="sumMoney" scope="session" value="${sumMoney+list1.price*list1.quantity}"></c:set>
		<td width="10%;"><input type="button"  value="删除" onclick="delectbuychar(${list1.scid })" /></td>
	</tr>
	</c:forEach>
	<tr>
		<td>总计</td>
		<td></td>
		<td ><font color="red">${errop }</font></td>
		<td></td>
		<td>${sumTicket}</td>
		<td>${sumMoney}</td>
		<td></td>
	</tr>
</table>
<table border="0" cellspacing="0" style="margin-left: 5%;width: 90%;margin-top: 2%;">
	<tr>
		<td width="80%" style="text-align: right;"><input type="button" style="width: 80px;" value="继续订票" onclick="contuen()" /></td>
		<td width="20%"><input type="button" style="width: 80px;" value="结 账 "  onclick="Checkout(${sumMoney})" /></td>
	</tr>
</table>

<script type="text/javascript">
	function contuen(){
		window.location="ticket/user_queryTickets";
	}
	function delectbuychar(scid){
		window.location="shoppingcart/deleteCart?scid="+scid;
	}
	function Checkout(sumMoney){
 		window.location="user/summaryMoney?sumMoney="+sumMoney;
	}
</script>
