<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<div id="myDiv">
用&nbsp;&nbsp;&nbsp;&nbsp;户：${session_user.username }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color="red">${errors_balance}</font>
<br/><br/><br/>
账户余额：${session_user.balance}
<br/><br/><br/>
<form action="user/topUpMoney" method="post">
	充值方式：
	<select name="type">
		<option value="空中充值">空中充值</option>
		<option value="支付宝">支付宝</option>
		<option value="微信">微信</option>
		<option value="储蓄卡">储蓄卡</option>
	</select>
	<br/><br/><br/>
	充值金额：<input type="text" name="money" value=""/>
	<font color='red'>${errors}</font>
	<br/><br/><br/>
	
	<input type="submit" class="button" style="margin-left: 35px;"  value="充值"/>
</form> 
</div>           