+<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/style.css"/>       
        <link rel="stylesheet" href="../assets/css/codemirror.css" >
        <link rel="stylesheet" href="../assets/css/ace.min.css" />
        <link rel="stylesheet" href="../font/css/font-awesome.min.css" />
         <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/style.css"/>       
        <link href="../assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/ace.min.css" />
        <link rel="stylesheet" href="../font/css/font-awesome.min.css" />
          <link  rel="stylesheet" href="../layui/css/layui.css" />
		<script src="js/jquery-1.9.1.min.js"></script> 
        <script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/typeahead-bs2.min.js"></script>           	
		<script src="../assets/js/jquery.dataTables.min.js"></script>
		<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="../assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="../assets/laydate/laydate.js" type="text/javascript"></script>
		<script src="../layui/layui.js"></script>
		<script src="../js/jquery-1.9.1.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/typeahead-bs2.min.js"></script>           	
		<script src="../assets/js/jquery.dataTables.min.js"></script>
		<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="../assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="../assets/laydate/laydate.js" type="text/javascript"></script>
<title>管理用户</title>
<style type="">
.page{
		margin-left: 1400px;
		color: red;
	}
</style>
</head>

<body>
 <div class="margin clearfix">
   <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning" title="添加用户"><i class="fa fa-plus"></i>&nbsp;添加公司信息</a>
        <a href="comexcle.do" class="btn btn-warning"> <i class="layui-icon layui-icon-download-circle">&nbsp;导出Excel</i> </a>
        
       </span>
       
     </div>
     <div class="compete_list">
       <table id="sample-table" class="table table-striped table-bordered table-hover" >
		 <thead>
			<tr>
				<th width="4%">公司编号</th>
				<th width="4%">公司名称</th>
				<th width="4%">联系人</th>
				<th width="4%">公司地址</th> 
				<th width="4%">公司电话</th>
				<th width="4%">开户银行</th>
				<th width="4%">备注信息</th>
				<th width="4%">修改时间</th>
				<th width="4%">详细信息</th>    
				<th width="20%">操作</th>
             </tr>
		    </thead>
             <tbody>
      	<c:forEach items="${selectComoany }" var="t" >
     <tr>
        
        <td width="4%">${t.comId }</td>               
        <td width="4%"><u style="cursor:pointer" class="text-primary">${t.comName}</u></td>
        <td width="4%">${t.comLinkman}</td>
        <td width="4%">${t.comAddress}</td>
        <td width="4%">${t.comPhone }</td> 
        <td width="4%">
        ${t.comBank=='1' ? "招商银行":"" }
		${t.comBank=='2' ? "中国银行":"" }
		${t.comBank=='3' ? "建设银行":"" }
		${t.comBank=='4' ? "邮政银行":"" }
		${t.comBank=='5' ? "平安银行":"" }	
        </td>   
        <td width="4%">${t.comRemark }</td>    
        <td width="4%"><fmt:formatDate value="${t.lastTime}" pattern="yyyy-MM-dd" /></td>
        <td width="5%"><a href="javascript:"  class="member_show"  onclick="jia(${t.comId})">查看详情</a></td>
        <td class="td-manage" width="5%">
        <a title="编辑" onclick="Competence_modify('560')" href='update.do?comId=${t.comId}'  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>        
        <a title="删除" href='del.do?comId=${t.comId}' onclick="return window.confirm('是否确定删除此用户?')"class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
		 </td>
		</tr>
    </c:forEach>											
		      </tbody>
	        </table>      
     </div>
 </div>
 

  
 <!--添加用户图层--> 
 <div class="add_menber" id="add_menber_style" style="display:none">
 <form action="goadde.do" method="post"  onsubmit=" return t()">

    <ul class=" page-content">
     <li><label class="label_name">公司名称：</label><span class="add_name"><input id="comName" name="comName" type="text"  class="text_add" placeholder="必填"/><input type="hidden" name="comId"></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">公司代码：</label><span class="add_name"><input  id="comCode" name="comCode" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">公司邮箱：</label><span class="add_name"><input  id="comEmail" name="comEmail" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">联系人：</label><span class="add_name"><input  id="comLinkman" name="comLinkman" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
   	 <li><label class="label_name">公司地址：</label><span class="add_name"><input  id="comAddress" name="comAddress" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">固定电话：</label><span class="add_name"><input  id="comPhone" name="comPhone" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">移动电话：</label><span class="add_name"><input  id="comYphone"  name="comYphone" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">传真：</label><span class="add_name"><input  id="comFax" name="comFax" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">开户银行：</label><span class="add_name">
       <select   id="comBank" name="comBank"  style="width: 170px;color:green;">
      <option value="0">请选择--</option>
      <option value="1">招商银行</option>
      <option value="2">中国银行</option>
      <option value="3">建设银行</option>
      <option value="4">邮政银行</option>
      <option value="5">平安银行</option>
      </select>
      </span><div class="prompt r_f"></div></li>
      <li><label class="label_name">银行账户：</label><span class="add_name"><input id="comBankuser" name="comBankuser" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">是否有效：</label><span class="add_name">
      <select id="comYesandno"  name="comYesandno"  style="width: 170px;color:green;">
      <option value="0">请选择--</option>
      <option value="1">有效</option>
      <option value="2">无效</option>
      </select>
      </span><div class="prompt r_f"></div></li>
      <li><label class="label_name">备注信息：</label><span class="add_name"><input name="comRemark" type="text" class="text_add" placeholder="必填"/></span><div class="prompt r_f"></div></li>
    
    </ul>
    <div class="center"> <input class="btn btn-primary" type="submit" id="submit" value="添加"/><br/><br/><br/><br/></div>
  </form>
  </div>
   <!-- 查看详情 -->
 <div class="add_menber" id="show_menber_style" style="display:none"> 
    <ul class=" page-content">
     <li><label class="label_name">公司名称：</label><span class="add_name"><input  type="text" readonly="readonly" id="comName1" class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">公司代码：</label><span class="add_name"><input  type="text" readonly="readonly" id="comCode1" class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">公司邮箱：</label><span class="add_name"><input readonly="readonly" type="text" id="comEmail1" class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">联系人：</label><span class="add_name"><input readonly="readonly" type="text" id="comLinkman1" class="text_add"/></span><div class="prompt r_f"></div></li>
        <li><label class="label_name">公司地址：</label><span class="add_name"><input  type="text" readonly="readonly" id="comAddress1" class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">固定电话：</label><span class="add_name"><input  type="text" readonly="readonly" id="comPhone1" class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">移动电话：</label><span class="add_name"><input readonly="readonly" type="text" id="comYphone1" class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">传真：</label><span class="add_name"><input readonly="readonly" type="text"  id="comFax1" class="text_add"/></span><div class="prompt r_f"></div></li>
        <li><label class="label_name">开户银行：</label><span class="add_name"><input  type="text" readonly="readonly" id="comBank1" class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">银行账户：</label><span class="add_name"><input  type="text" readonly="readonly" id="comBankuser1" class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">是否有效：</label><span class="add_name"><input readonly="readonly" type="text" id="comYesandno1" class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">备注信息：</label><span class="add_name"><input readonly="readonly" type="text" id="comRemark1" class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">修改时间：</label><span class="add_name"><input readonly="readonly" type="text" id="lastTime1" class="text_add"/></span><div class="prompt r_f"></div></li>
   </ul>
 </div> 
</body>
</html>
<script>
	function t(){
		var comName = document.getElementById("comName").value;
		var comCode = document.getElementById("comCode").value;
		var comEmail = document.getElementById("comEmail").value;
		var comLinkman = document.getElementById("comLinkman").value;
		var comAddress = document.getElementById("comAddress").value;
		var comPhone = document.getElementById("comPhone").value;
		var comYphone = document.getElementById("comYphone").value;
		var comFax = document.getElementById("comFax").value;
		var regTel = /0?(13|14|15|18|17)[0-9]{9}/;
		var emal= /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
		if (comName==""){
			  layer.alert('公司名称不能为空!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
            if (comCode==""){
			  layer.alert('公司代码不能为空!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
          if (!emal.test(comEmail)){
			  layer.alert('公司邮箱格式错误!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
           if (comLinkman==""){
			  layer.alert('公司联系人不能为空!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
            if (comAddress==""){
			  layer.alert('公司地址不能为空!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
             if (!regTel.test(comPhone)){
			  layer.alert('电话格式错误!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
             if (comFax==""){
			  layer.alert('公司传真不能为空!',{
              title: '提示框',				
				icon:0, 
			 });
			return false;
          } 
          }
</script>
<script type="text/javascript">
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加公司',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		
    });
});

$('.member_show').on('click', function(){
    layer.open({
      type: 1,
      title: '详细信息',
      area: ['800px', ''],
      shadeClose: true, //点击遮罩关闭
      maxmin: true, 
      content:$('#show_menber_style')
     })
});
 
function jia(dutId)
    {
        var url='detail.do?dutId='+dutId;
   //ajax异步请求
   $.ajax
   ({
      type:"post",
      url:url,
      dataType:"json",
      success:function(data)
      {
       	 $("#comName1").val(data.comName);
         $("#comCode1").val(data.comCode);//将取出的值覆盖原来的值 （val对值进行操作)
         $("#comEmail1").val(data.comEmail);
         $("#comLinkman1").val(data.comLinkman); 
          $("#comAddress1").val(data.comAddress);
         $("#comPhone1").val(data.comPhone);//将取出的值覆盖原来的值 （val对值进行操作)
         $("#comYphone1").val(data.comYphone);
         $("#comFax1").val(data.comFax); 
          $("#comBankuser1").val(data.comBankuser);
         $("#comYesandno1").val(data.comYesandno);//将取出的值覆盖原来的值 （val对值进行操作)
         $("#comBank1").val(data.comBank);
         $("#comRemark1").val(data.comRemark);
          $("#lastTime1").val(data.lastTime);   
           
      }
    });   
    } 
</script>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});	
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
</script>
