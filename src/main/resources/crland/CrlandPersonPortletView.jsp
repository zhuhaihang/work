<%@page session="false" contentType="text/html" pageEncoding="GB18030"
	import="java.util.*,javax.portlet.*,com.ibm.crlandperson.*"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@taglib
	uri="http://www.ibm.com/xmlns/prod/websphere/portal/v6.1/portlet-client-model"
	prefix="portlet-client-model"%>
<portlet:defineObjects />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String homePath = request.getScheme() + "://"
			+ request.getServerName();
%>
<link rel="stylesheet" href="<%=basePath%>css/style.css">
<link rel="stylesheet" href="<%=basePath%>css/todo.css">
<link href='<%=basePath%>js/fullcalendar.css' rel='stylesheet' />
<link href='<%=basePath%>js/fullcalendar.print.css' rel='stylesheet' media='print' />
<script type="text/javascript">
var  path='<%=basePath%>';
var  homepath='<%=homePath%>';
var  uid='<%=request.getUserPrincipal().getName().toLowerCase()%>';
</script>
<style>
.fc-event-title{
margin-left: 6px;
}
.jp_tab3 td{
text-align: center;
}
 .con a:hover {text-decoration:underline;}
/* .fc-header{
margin-left:0px;
} */
</style>
<script type="text/javascript">
          /* $(document).ready(function() {
			$("#fybx3").click(function(){
			alert($(this).attr("href"));
			if(''==$(this).attr("href")||null==$(this).attr("href")){
			alert("你没有相应权限222！");
			}

	});
	});   */
        $(function(){
		<portlet:namespace/>loadDetail();
		$("#crc_mobileApp").hide();
});
    var topDeptId="";
    var xmldata="";
    var name="";
    var dept="";
    var hrpic="";
    /* 查询部门详细信息 */
	function <portlet:namespace/>loadDetail(){
	
			$.ajax({
			url : "/wps/CrcPortalWS/services/emp/findEmpDetail",
			type:"get",
			async: false,
			data:{"userLoginID":"<%=request.getUserPrincipal().getName()%>" },
			success : function(json) {
			        console.log(json);
					topDeptId=json.topDeptId;
					twoDeptid=json.twoDeptid;
					//alert(topDeptId);
					if("10089"==topDeptId){
					$("#oapxqx").val("");
					$("#oaycsb").val("http://oasz.crland.cn/szcr/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
					$("#oaxjsq2").val("http://oasz.crland.cn/szcr/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");
					
					$("#oawcsq").val("http://oasz.crland.cn/szcr/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
					//缺，有问题
					$("#oajbsq").val("http://oasz.crland.cn/szcr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
					$("#oaxjsq").val("http://oasz.crland.cn/szcr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
					$("#oaccsq").val("http://oasz.crland.cn/szcr/xzbg/ccgl_sz.nsf/frmcreatedoc?openform");
					$("#fybx1").attr("href","http://oasz.crland.cn/szcr/fin/fybx_sz.nsf/frmcreatedoc?openform");
					$("#fybx2").attr("href","http://oasz.crland.cn/szcr/fin/clbx_sz.nsf/frmcreatedoc?openform");
					$("#fybx3").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
					}else if("1566544"==topDeptId){//商业华南大区
						if("1566605"==twoDeptid){//商业华南此链接检查一下
							$("#oaycsb").val("http://oasz.crland.cn/syhncr/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
							$("#oaxjsq2").val("http://oasz.crland.cn/syhncr/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");
							
							$("#oapxqx").val("");
							$("#oawcsq").val("http://oasz.crland.cn/syhncr/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
							$("#oajbsq").val("http://oasz.crland.cn/syhncr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
							$("#oaxjsq").val("http://oasz.crland.cn/syhncr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
							$("#oaccsq").val("http://oasz.crland.cn/syhncr/zhbg/ccgl.nsf/frmCreateDoc?openform");
							$("#fybx1").attr("href","http://oasz.crland.cn/syhncr/cwgl/fybx.nsf/frmCreateDoc?openform");
							$("#fybx2").attr("href","http://oasz.crland.cn/syhncr/cwgl/clbx.nsf/frmCreateDoc?openform");
							$("#fybx3").attr("href","");
						}else{
							$("#oaycsb").val("");
							$("#oaxjsq2").val("");
							
							$("#oapxqx").val("");
							$("#oawcsq").val("");
							$("#oajbsq").val("");
							$("#oaxjsq").val("");
							$("#oaccsq").val("");
							$("#fybx1").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
							$("#fybx2").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
							$("#fybx3").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
						}
					}else if("9302"==topDeptId){//置地总部
					$("#oaycsb").val("http://oahq.crland.cn/croa/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
					$("#oaxjsq2").val("http://oahq.crland.cn/croa/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");

					$("#oapxqx").val("http://oahq.crland.cn/croa/xzbg/pxgl_zb.nsf/frmcreatedoc?openform");
					$("#oawcsq").val("http://oahq.crland.cn/croa/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
					$("#oajbsq").val("http://oahq.crland.cn/croa/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
					$("#oaxjsq").val("http://oahq.crland.cn/croa/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
					/* $("#oaccsq").val("http://oahq.crland.cn/croa/xzbg/ccgl_zb.nsf/frmCreateDoc?openform"); */
					$("#oaccsq").val("http://oahq.crland.cn/croa/xzbg/ccgl_zb.nsf/frmJumpPage?OpenForm");//新出差申请友情提示的链接
					
					/* $("#fybx1").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmcreatedoc?openform");
					$("#fybx2").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmcreatedoc?openform");
					$("#fybx3").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmcreatedoc?openform"); */
					$("#fybx1").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmJumpPage?OpenForm");
					$("#fybx2").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmJumpPage?OpenForm");
					$("#fybx3").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmJumpPage?OpenForm");//新费用报销友情提示的链接
					}else if("1509651"==topDeptId){//物业总公司总部
					if("1509558"==twoDeptid){
						$("#oaycsb").val("http://oawy.crland.cn/wycr/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
						$("#oaxjsq2").val("http://oawy.crland.cn/wycr/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");
						
						$("#oapxqx").val("http://oawy.crland.cn/indishare/office.nsf/(frame)/frame");
						$("#oawcsq").val("http://oawy.crland.cn/wycr/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
						$("#oajbsq").val("http://oawy.crland.cn/wycr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
						$("#oaxjsq").val("http://oawy.crland.cn/wycr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
						$("#oaccsq").val("http://oawy.crland.cn/wycr/xzbg/ccgl_zb.nsf/frmCreateDoc?openform");
						$("#fybx1").attr("href","http://oawy.crland.cn/indishare/office.nsf/(frame)/frame");
						$("#fybx2").attr("href","http://oawy.crland.cn/indishare/office.nsf/(frame)/frame");
						$("#fybx3").attr("href","http://oawy.crland.cn/indishare/office.nsf/(frame)/frame");
					}else{
						$("#oaycsb").val("");
						$("#oaxjsq2").val("");
						
						$("#oapxqx").val("");
						$("#oawcsq").val("");
						$("#oajbsq").val("");
						$("#oaxjsq").val("");
						$("#oaccsq").val("");
						$("#fybx1").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
						$("#fybx2").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
						$("#fybx3").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
					}
					
					}else if("1566544"==topDeptId){//商业地产事业部总部
					$("#oaycsb").val("http://oahq.crland.cn/croa/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
					$("#oaxjsq2").val("http://oahq.crland.cn/croa/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");
					
					$("#oapxqx").val("http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
					$("#oawcsq").val("http://oahq.crland.cn/croa/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
					$("#oajbsq").val("http://oahq.crland.cn/croa/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
					$("#oaxjsq").val("http://oahq.crland.cn/croa/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
					$("#oaccsq").val("http://oahq.crland.cn/croa/xzbg/ccgl_zb.nsf/frmCreateDoc?openform");					
					$("#fybx1").attr("href","http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
					$("#fybx2").attr("href","http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
					$("#fybx3").attr("href","http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
					}else if("10359"==topDeptId){//东北大区
						/* if("1352394"==twoDeptid||("9028"==twoDeptid&&"1334881"!=twoDeptid)){
							$("#oaycsb").val("http://oaln.crland.cn/lncr/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
							$("#oaxjsq2").val("http://oaln.crland.cn/lncr/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");

							$("#oapxqx").val("http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
							$("#oawcsq").val("http://oaln.crland.cn/lncr/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
							$("#oajbsq").val("http://oaln.crland.cn/lncr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
							$("#oaxjsq").val("http://oaln.crland.cn/lncr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
							$("#oaccsq").val("http://oaln.crland.cn/lncr/xzbg/ccgl_ln.nsf/frmCreateDoc?openform");					
							$("#fybx1").attr("href","http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
							$("#fybx2").attr("href","http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
							$("#fybx3").attr("href","http://oahq.crland.cn/indishare/office.nsf/(frame)/frame#workspace");
						}else{ */
							/* $("#oapxqx").val("");
							$("#oawcsq").val("http://oaln.crland.cn/lncr/rlzy/yckq.nsf/frmcreatedoc?openform");
							$("#oajbsq").val("");
							$("#oaxjsq").val("http://oaln.crland.cn/lncr/kaoqin/qjsq_sy.nsf/frmcreatedoc?openform");
							$("#oaccsq").val("http://oaln.crland.cn/lncr/xzbg/ccgl_ln.nsf/frmcreatedoc?openform");
							$("#fybx1").attr("href","http://oaln.crland.cn/lncr/cw/ydfybx.nsf/frmcreatedoc?openform");
							$("#fybx2").attr("href","http://oaln.crland.cn/lncr/cw/clfybx.nsf/frmcreatedoc?openform");
							$("#fybx3").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')"); */
							//培训缺席请假申请，缺
							$("#oapxqx").val("");
							//外出申请
							$("#oawcsq").val("http://oaln.crland.cn/lncr/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
							//加班申请
							$("#oajbsq").val("http://oaln.crland.cn/lncr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
							//休假申请
							$("#oaxjsq").val("http://oaln.crland.cn/lncr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
							//出差申请,缺
							$("#oaccsq").val("");
							//异常申补
							$("#oaycsb").val("http://oaln.crland.cn/lncr/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
							//销假申请
							$("#oaxjsq2").val("http://oaln.crland.cn/lncr/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");
							
							$("#fybx1").attr("href","http://oaln.crland.cn/lncr/cw/ydfybx.nsf/frmcreatedoc?openform");
							$("#fybx2").attr("href","http://oaln.crland.cn/lncr/cw/clfybx.nsf/frmcreatedoc?openform");
							$("#fybx3").attr("onclick","alert('您所在区域暂未配置此类流程，请联系单位HR确认！')");
						/* } */
					
					}
					name=json.empName;
					dept=json.topDeptDesc+"-"+json.twoDeptDesc;
					hrpic=json.currentHrEmpId;
					getPortalInfo(json.currentHrEmpId);
					$("#employid").val(json.currentHrEmpId);
					/* var hradress=homepath+"/SharedRes/appimages/hrphoto/"+json.empUid+hrpic+".jpg";
		            $("#name1").html(name);
		            $("#dept1").html(dept);
		            $("#hrph1").attr("src",hradress);
		            $("#name2").html(name);
		            $("#dept2").html(dept);
		            $("#hrph2").attr("src",hradress);
		            $("#name3").html(name);
		            $("#dept3").html(dept);
		            $("#hrph3").attr("src",hradress); */
		      },
				error : function() {
					//alert("error2");
				}
			});

	}
	/*查询TRS文本信息的概览*/
	function getXmldata(type){
	$.ajax({
	  url: "/SharedRes/home/crland_home/zdmh/dqmh/"+topDeptId+"/bszq/"+type+"/index.xml",//这里是你的XML文件的路径
	  dataType:"xml",
	  async: false,
	  success: function(xml){
	     xmldata=xml;
	  },
	  error:function() {
	       //alert('error');
	       
	     }
	});
	}
	/*休假*/
    var HolidayJson;
	var currentpxPage2=1;
	function loadpxPage2(str){
	$("#topxPage2").html("共"+Math.ceil(HolidayJson.length/6)+"页");
	if("1"==str){
	  currentpxPage2=1;
	}else if("2"==str){
	  if(currentpxPage2>1){
	  currentpxPage2--;}
	}else if("3"==str){
	  if(currentpxPage2<Math.ceil(HolidayJson.length/6)){
	  currentpxPage2++;}

	}else if("4"==str){
	  currentpxPage2=Math.ceil(HolidayJson.length/6);
	}else{
	  var numpxPage2=$("#jumppxid2").val();
	  if(!isNaN(numpxPage2)&&numpxPage2<Math.ceil(HolidayJson.length/6)+1){
	    currentpxPage2=$("#jumppxid2").val();
	  }else{
	  alert("请输入正确的页数！");
	  }
	
	}
	$("#cupxPage2").html("第"+currentpxPage2+"页");
	var startpxPage2=1+(currentpxPage2-1)*6;
	var ppggpx2=HolidayJson.length%6;
	var endpxPage2;
	endpxPage2=1+currentpxPage2*6;

	if(0!=ppggpx2&&currentpxPage2==Math.ceil(HolidayJson.length/6)){
	  endpxPage2=startpxPage2+HolidayJson.length%6;
	}
	console.log(startpxPage2,endpxPage2);
	console.log("fff"+HolidayJson[0].employid);
	makepxhtml2(startpxPage2,endpxPage2);
	}
	function makepxhtml2(startpxPage2,endpxPage2){
    var html='<tr><th style="width:164px">假期类型</th><th>开始日期</th><th style="width:104px">结束日期</th><th>天数</th></tr>';
    console.log("休假的json"+HolidayJson);
    if(""!=HolidayJson&HolidayJson!=null){
    
    for(var i=startpxPage2-1;i<endpxPage2-1;i++){
     html+='<tr><td style="height:20px" title="'+HolidayJson[i].vacaionType+'">'+HolidayJson[i].vacaionType+'</td><td>'+HolidayJson[i].startDt+'</td><td>'+HolidayJson[i].endDt+'</td><td>'+HolidayJson[i].num+'</td></tr>';
    }
    $("#pxtableid2").html(html);
    }
    }
	function loadZp(str){
	    $('#'+str).removeClass().addClass("active_h");
	     $('#'+str).siblings().removeClass().addClass("leave_h");
	}
	function openMask(divtype){
	   var html="";
	   $("#widthdiv").css("width","132px");
	if('xcfl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,薪酬政策'"+')">薪酬政策</a></h5><h5 class="act" id="bid"><a onclick="changeDiv('+"'bid,福利政策'"+')">福利政策</a></h5><h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,商业保险'"+')">商业保险</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,薪酬政策');
	   }
	else if('grsw'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,个人信息'"+')">个人信息</a></h5><h5 class="act" id="bid"><a  style="display:none" onclick="changeDiv('+"'bid,离职申请'"+')">离职申请</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,个人信息');
	}
	else if('kqgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,考勤政策'"+')">考勤政策</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,考勤政策');
	}
	else if('jbgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,加班政策'"+')">加班政策</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,加班政策');
	}  
	else if('ccgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,出差政策'"+')">出差政策</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,出差政策');
	}
	else if('fybx'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,费用报销'"+')">费用报销</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").show();
	   changeDiv('aid,费用报销');
	} 
	else if('xjgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,我的休假'"+')">我的休假</a></h5><h5 class="act" id="bid"><a onclick="changeDiv('+"'bid,休假政策'"+')">休假政策</a></h5><h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,公司休假公告'"+')">公司休假公告</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,我的休假');
	} 
	else if('pxgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,我的培训记录'"+')">我的培训记录</a></h5><h5 class="act" id="bid"><a onclick="changeDiv('+"'bid,在线学习'"+')">在线学习</a></h5><h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,培训观念与体系'"+')">培训观念与体系</a></h5><h5 class="act" id="did"><a onclick="changeDiv('+"'did,培训纪律管理'"+')">培训纪律管理</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,我的培训记录');
	}  
	else if('zphd'==divtype){
	   getXmldata(divtype);
	   html=''+
	   '<h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,内部招聘策略'"+')">内部招聘策略</a></h5><h5 class="act" id="did"><a onclick="changeDiv('+"'did,内部招聘程序'"+')">内部招聘程序</a></h5><h5 class="act" id="eid"><a onclick="changeDiv('+"'eid,内部推荐政策'"+')">内部推荐政策</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('cid,内部招聘策略');
	}
	   $(".mask2").show();
	   $(".total2").show();
	   
	}
	function closeMask(){
	   $(".mask2").hide();
	   $(".total2").hide();
	   $("#persondiv").hide();
	   $("#persondiv1").hide();
	   $("#persondiv2").hide();
	   $("#persondiv3").hide();
	   $("#persondiv4").hide();
	   $("#persondiv5").hide();
	   $("#persondiv6").hide();
	   $("#rightlink").hide();
	   $("#widthdiv").css("width","132px");
	   $("#widthdiv2").hide();
	   $("#widthdiv3").hide();
	}
	var newilearnJson;
	var currentpxPage=1;
	function loadpxPage(str){
	$("#topxPage").html("共"+Math.ceil(newilearnJson.length/8)+"页");
	if("1"==str){
	  currentpxPage=1;
	}else if("2"==str){
	  if(currentpxPage>1){
	  currentpxPage--;}
	}else if("3"==str){
	  if(currentpxPage<Math.ceil(newilearnJson.length/8)){
	  currentpxPage++;}

	}else if("4"==str){
	  currentpxPage=Math.ceil(newilearnJson.length/8);
	}else{
	  var numpxPage=$("#jumppxid").val();
	  if(!isNaN(numpxPage)&&numpxPage<Math.ceil(newilearnJson.length/8)+1){
	    currentpxPage=$("#jumppxid").val();
	  }else{
	  alert("请输入正确的页数！");
	  }
	
	}
	$("#cupxPage").html("第"+currentpxPage+"页");
	var startpxPage=1+(currentpxPage-1)*8;
	var ppggpx=newilearnJson.length%8;
	var endpxPage;
	endpxPage=1+currentpxPage*8;

	if(0!=ppggpx&&currentpxPage==Math.ceil(newilearnJson.length/8)){
	  endpxPage=startpxPage+newilearnJson.length%8;
	}
	console.log(startpxPage,endpxPage);
	console.log("fff"+newilearnJson[0].employid);
	makepxhtml(startpxPage,endpxPage);
	}
	function makepxhtml(startpxPage,endpxPage){
    var html='<tr><th style="width:164px">课程名称</th><th>主要教学方式</th><th>培训类型</th><th>开始日期</th><th>结束日期</th><th style="width:114px">培训学时（小时）</th><th style="width:60px">状态</th><th style="width:60px">得分</th><th style="width:60px">优秀学员</th></tr>';
    console.log("培训makehtml的json"+newilearnJson);
    if(""!=newilearnJson&newilearnJson!=null){
    
    for(var i=startpxPage-1;i<endpxPage-1;i++){
    
     html+='<tr><td title="'+newilearnJson[i].descr100+'">'+newilearnJson[i].descr100+'</td><td>'+newilearnJson[i].descr1+'</td><td>'+newilearnJson[i].descr2+'</td><td>'+newilearnJson[i].course_start_dt+'</td><td>'+newilearnJson[i].course_end_dt+'</td><td >'+newilearnJson[i].descr30+'</td><td>'+newilearnJson[i].status_descr+'</td><td>'+newilearnJson[i].crc_ableend_scrore+'</td><td >'+newilearnJson[i].college_type+'</td></tr>';
    }
    $("#pxtableid").html(html);
    }
    }
    function getPortalInfo(str){
        /* 获取门户个人信息 */
	        $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findPortalUser",
				type:"POST",
				data:{employid:str},
				dataType:"json",
				success:function(data){
					if(data.length>0){
					$("#psname1").html(data[0].name);
					$("#psjob1").html(data[0].job);
					$("#psdept1").html(data[0].dept);
					$("#workyear").html(data[0].companyAge);
					$("#workmonth").html(parseInt(data[0].companyMon));
					$("#psageid").html(data[0].age);
					$("#experid").html(data[0].experien);
					$("#ourid").html(data[0].companyAge);
					$("#lvlid").html(data[0].grade);
					$("#cout1id").html(data[0].transferNum);
					$("#cout2id").html(data[0].promoteNum);
					$("#cout3id").html(data[0].rewardNum);
					$("#cout4id").html(data[0].learnInNum);
					var hrpic="<%=request.getUserPrincipal().getName().toLowerCase()%>";
					var hradress=homepath+"/SharedRes/appimages/hrphoto/"+hrpic+data[0].employeeId+".jpg";;
		            $("#grllps").attr("src",hradress);
		            $("#hrph1").attr("src",hradress);
		            $("#name2").html(data[0].name);
		            $("#dept2").html(data[0].dept);
		            $("#job2").html(data[0].job);
		            $("#hrph2").attr("src",hradress);
		            $("#name3").html(data[0].name);
		            $("#dept3").html(data[0].dept);
		            $("#job3").html(data[0].job);
		            $("#hrph3").attr("src",hradress);
					}
					console.log(data);
				},
				error:function(){
				console.log("门户人员信息error");
				}
			});
    }
	/* 显示内容切换 */
	function changeDiv(str2){
	var strl=str2.split(",");
	if(strl.length>1){
	     if('薪酬政策'==strl[1]){
	        $("#spanid").html('<a href="http://hrms-sso.crc.com.cn/web/#/employee/mySalary/mySalaryInfo" target="_blank" style="color:white"  >工资单查询</a>');
	        $("#persondiv").hide();
	        $("#persondiv1").hide();
	        $("#linkDiv").show();
	     }else if('考勤政策'==strl[1]){
	    
	     if(""==$("#oawcsq").val()){
	     $("#spanid").html('<a  onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white" target="_black" >外出申请</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oawcsq").val()+'" style="color:white" target="_black" >外出申请</a>');
	     }
	     if(""==$("#oaycsb").val()){
	 	     $("#spanid2").html('<a  onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white" target="_black" >异常申补</a>');
	 	     }else{
	 	     $("#spanid2").html('<a href="'+$("#oaycsb").val()+'" style="color:white" target="_black" >异常申补</a>');
	 	     }
	      if(""==$("#oaxjsq2").val()){
	 	     $("#spanid3").html('<a  onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white" target="_black" >销假申请</a>');
	 	     }else{
	 	     $("#spanid3").html('<a href="'+$("#oaxjsq2").val()+'" style="color:white" target="_black" >销假申请</a>');
	 	     }
	      $("#widthdiv2").show();
	      $("#widthdiv3").show();
	        $("#linkDiv").show();
	     }else if('离职申请'==strl[1]){
	        $("#spanid").html('<a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_WKC_MAIN_CM.GBL?Page=CRC_WKC_MAIN_PG&Action=A&CRC_DATA_TYPE=DT001&CRC_FLOWID=CR005527&SETID=CR005&CRC_WKC_EOAW_ID=NEW&CRC_FLAG=1&languageCd=ZHS" style="color:white" target="_black" >离职申请</a>');
	        $("#persondiv2").hide();
	        $("#linkDiv").show();
	     }
	     else if('出差政策'==strl[1]){
	     if(""==$("#oaccsq").val()){
	      $("#spanid").html('<a onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white"  >出差申请</a>');
	     }else{
	      $("#spanid").html('<a href="'+$("#oaccsq").val()+'" style="color:white" target="_black" >出差申请</a>');
	     }
	       
	        $("#linkDiv").show();
	     }
	     else if('个人信息'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv2").show();
	        $("#linkDiv").hide();
	         /* 获取门户个人信息 */
	        $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findPortalUser",
				type:"POST",
				data:{employid:$("#employid").val()},
				dataType:"json",
				success:function(data){
					if(data.length>0){
					$("#psname1").html(data[0].name);
					$("#psjob1").html(data[0].job);
					$("#psdept1").html(data[0].dept);
					$("#workyear").html(data[0].companyAge);
					$("#workmonth").html(parseInt(data[0].companyMon));
					$("#psageid").html(data[0].age);
					$("#experid").html(data[0].experien);
					$("#ourid").html(data[0].companyAge);
					$("#lvlid").html(data[0].grade);
					$("#cout1id").html(data[0].transferNum);
					$("#cout2id").html(data[0].promoteNum);
					$("#cout3id").html(data[0].rewardNum);
					$("#cout4id").html(data[0].learnInNum);
					var hrpic="<%=request.getUserPrincipal().getName().toLowerCase()%>";
					var hradress=homepath+"/SharedRes/appimages/hrphoto/"+hrpic+data[0].employeeId+".jpg";;
		            $("#hrph1").attr("src",hradress);
		            $("#name2").html(data[0].name);
		            $("#dept2").html(data[0].dept);
		            $("#job2").html(data[0].job);
		            $("#hrph2").attr("src",hradress);
		            $("#name3").html(data[0].name);
		            $("#dept3").html(data[0].dept);
		            $("#job3").html(data[0].job);
		            $("#hrph3").attr("src",hradress);
					}
					console.log(data);
				},
				error:function(){
				console.log("门户人员信息error");
				}
			});
	     }
	     else if('加班政策'==strl[1]){
	     if(""==$("#oajbsq").val()){
	     $("#spanid").html('<a onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white" >加班申请</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oajbsq").val()+'" style="color:white" target="_black" >加班申请</a>');
	     }
	        
	        $("#linkDiv").show();
	     }
	     else if('内部招聘策略'==strl[1]){
	        $("#spanid").html('<a href="http://careers.crland.com.hk/internalrecruitment/" style="color:white" target="_black" >内部招聘职位详情</a>');
	        $("#widthdiv").css("width","172px");
	        $("#linkDiv").show();
	     }
	     else if('内部推荐政策'==strl[1]){
	        $("#spanid").html('<a href="http://careers.crland.com.hk/internalreferral/" style="color:white" target="_black" >内部推荐职位详情</a>');
	        $("#widthdiv").css("width","172px");
	        $("#linkDiv").show();
	     }
	     else if('我的休假'==strl[1]){
	     if(""==$("#oaxjsq").val()){
	     $("#spanid").html('<a onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white" target="_black" >休假申请</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oaxjsq").val()+'" style="color:white" target="_black" >休假申请</a>');
	     }
	        
	        $("#iframediv").hide();
            $("#persondiv1").hide();
	        $("#persondiv").show();
	        $("#linkDiv").show();
	        $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findHoliday",
				type:"POST",
				data:{employid:$("#employid").val()},
				dataType:"json",
				success:function(data){
					if(data.length>0){
				    HolidayJson=data;
				    var total=parseInt(data[0].hughHas)+parseInt(data[0].hughRest);
				    //document.getElementById("yixiu").style.width=300*parseInt(data[0].hughHas)/total+"px";
				    $("#yixiu").html("剩余"+data[0].hughHas+"天");
				    //document.getElementById("shengyu").style.width=300*parseInt(data[0].hughRest)/total+"px";
				    $("#shengyunum").html("已休"+data[0].hughRest+"天");
				    $("#pagepxid2").show();
				    $("#yearHoli").html(new Date().getFullYear());
				    loadpxPage2("1");
				    }
				    else{
				    $("#pagepxid2").hide();
				    HolidayJson=null;
				    $("#pxtableid2").html("");
				    }
				    $("#jumppxid2").val(null);
					console.log("2"+data);
				},
				error:function(){
				console.log("休假error");
				}
			});	
	     }
	     else if('公司休假公告'==strl[1]){	   
	        $("#iframediv").hide();
	        $("#persondiv").hide();
	        $("#persondiv1").show();
	        $("#linkDiv").hide();
	        $('#calendar2').empty();
          $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findcalendar",
				type:"POST",
				data:{cacode:''},
				dataType:"json",
				success:function(data){
					console.log(data);
					//alert(homepath);path取的地址是Dismis里的jquery1.8，如果日历插件显示错误则路径获取js错误
					$.getScript(path+'js/jquery-1.8.1.min.js').done(function(){
            $.getScript(path+'js/fullcalendar.js').done(function(){
             	$('#calendar2').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month'
			},
			eventAfterRender: function(event, element, view) {
			   $(element).css('width','28px');
			   var top = $(element).css('top').replace("px","");
			   
			   console.log("top:"+top);
			   top=top-60;
			   $(element).css('top', top + 'px');
			  },
			monthNames:['一月','二月', '三月', '四月', '五月', '六月', '七月',
 '八月', '九月', '十月', '十一月', '十二月'],
           dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
           dayNamesShort: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
           buttonText:{
				 prev:     '上月',
				 next:     '下月',
				 prevYear: '去年',
				 nextYear: '明年',
				 today:    '今天',
				 month:    '月',
				 week:     '周',
				 day:      '日'
				 },
			defaultDate: new Date(),
			editable: true,
			aspectRatio:1.5,
			eventLimit: true, // allow "more" link when too many events
			events:data
		});

		$("#fc-dateSelect").delegate("select","change",function(){
			var fcsYear = $("#fcs_date_year").val();
			var fcsMonth = $("#fcs_date_month").val();
			$("#calendar2").fullCalendar('gotoDate', fcsYear, fcsMonth);
		});  });

     	   });
				},
				error:function(){
				console.log("error2");
				}
			});	

	        
	     }
	     else if('我的培训记录'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv3").show();
	        $("#persondiv4").hide();
	        $("#linkDiv").hide();
	        /* 获取培训记录 */
	        $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findilearn",
				type:"POST",
				data:{employid:$("#employid").val()},
				dataType:"json",
				success:function(data){
					$("ybmpx").html(data.length);
					if(data.length>0){
				    newilearnJson=data;
				    $("#pagepxid").show();
				    loadpxPage("1");
				    var a=data.length;//已报名培训数
                    var b=0;//已完成培训次数
                    var c=0;//优秀学员次数
                    var d=0;//已完成培训小时数
                    var e=null;//所有课程分数相加
                    for(var i=0;i<data.length;i++){
                    if(data[i].status_descr.indexOf("已完成")>=0){
                     b+=1;
                     d+=parseFloat(data[i].descr30);
                    }
                    if(data[i].college_type.indexOf("是")>=0){
                     c+=1;
                    }
                    
                    e+=parseInt(data[i].crc_ableend_scrore);
                    }
                    $("#ybmnum").html(a);
                    $("#ywcnum").html(b);
                    $("#yxxynum").html(c);
                    $("#ywcpxnum").html(d);
                    $("#pjdfnum").html((e/parseInt(data.length)).toFixed(2));////
				    }
				    else{
				    $("#pagepxid").hide();
				    newilearnJson=null;
				    $("#pxtableid").html("");
				    }
				    $("#jumppxid").val(null);
					console.log("2"+data);
					/* console.log("培训记录："+data); */
				},
				error:function(){
				console.log("培训error");
				}
			});	
	     }
	     else if('在线学习'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv4").show();
	        $("#persondiv3").hide();
	        $("#linkDiv").hide();
	     }
	     else if('培训理念与体系'==strl[1]){
	        $("#iframediv").show();
	        $("#persondiv3").hide();
	        $("#persondiv4").hide();
	        $("#linkDiv").hide();
	     }
	     else if('培训纪律管理'==strl[1]){
	        if(""==$("#oapxqx").val()){
	     $("#spanid").html('<a onclick="alert(\'您所在区域暂未配置此类流程，请联系单位HR确认！\')" style="color:white" target="_black" >培训缺席请假申请</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oapxqx").val()+'" style="color:white" target="_black" >培训缺席请假申请</a>');
	    
	     }
	        
	        $("#widthdiv").css("width","172px");
	        $("#iframediv").show();
	        $("#persondiv3").hide();
	        $("#persondiv4").hide();
	        $("#linkDiv").show();
	     }
	     else if('内部招聘'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv6").hide();
	        $("#persondiv5").show();
	        $("#linkDiv").hide();
	        $.getScript(path+'js/jquery-1.8.1.min.js').done(function(){
            $.getScript(path+'js/jquery.paginate.js').done(function(){
             	$("#pagination5").paginate({
     				count:50,
     				start: 1,
     				display:8,
     				border: true,
     				border_color: '#E3E3E3',
     				text_color : '#000',
     				background_color: '#FFF',	
     				text_hover_color : '#FFF',
     				background_hover_color: '#FFAC48'
     			    
     			});  });

     	   });
	        
	     }
	      else if('内部推荐'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv5").hide();
	        $("#persondiv6").show();
	        $("#linkDiv").hide();
	        $.getScript(path+'js/jquery-1.8.1.min.js').done(function(){
            $.getScript(path+'js/jquery.paginate.js').done(function(){
             	$("#pagination6").paginate({
     				count:50,
     				start: 1,
     				display:8,
     				border: true,
     				border_color: '#E3E3E3',
     				text_color : '#000',
     				background_color: '#FFF',	
     				text_hover_color : '#FFF',
     				background_hover_color: '#FFAC48'
     			    
     			});  });

     	   });
	     }
	     else{
	        $("#linkDiv").hide();
	        $("#persondiv").hide();
	        $("#persondiv1").hide();
	        $("#persondiv2").hide();
	        $("#persondiv3").hide();
	        $("#persondiv4").hide();
	        $("#persondiv5").hide();
	        $("#persondiv6").hide();
	     }
	     $('#'+strl[0]).removeClass().addClass("vst");
	     $('#'+strl[0]).siblings().removeClass().addClass("act");
	            /* 遍历需要的TRS文本信息 */
	     $(xmldata).find("NEW").each(function() {  
			if(strl[1]==$(this).children("TITLE").text()){
			var http=$(this).children("URL").text();
			$("#iframediv").show();
			$("#iframemy").attr("src",http); 
			console.log(http);
			$("#persondiv").hide();
			$("#persondiv1").hide();
	        $("#persondiv2").hide();
	        $("#persondiv3").hide();
	        $("#persondiv4").hide();
	        $("#persondiv5").hide();
	        $("#persondiv6").hide();
			}
		});
		}
	}
</script>





<div class="con" style="width:908px">
	<div class="title" style="width:908px;background-color: rgba(117, 106, 106, 0.09);">
		<span class="selectd">办事专区</span>
		
	</div>
	<div style=" width: 890.2px;border: 1px solid #cecbcb;height: 294px;margin-left: 7px;margin-top: 11px;">
	<div style="width:1000px">
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('grsw');" src="<%=basePath%>/images/1.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('grsw');">个人事务</a></span><br/><span style="color:rgb(164, 164, 164)">个人信息查询/修改</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('xcfl');" src="<%=basePath%>/images/2.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('xcfl');">薪酬福利</a></span><br/><span style="color:rgb(164, 164, 164);display: block;line-height: 14px;width: 122px;margin-left: 27px;">工资单，薪酬福利政策，商业保险</span>
    </div>
	<div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	   <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('kqgl');" src="<%=basePath%>/images/3.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('kqgl');">考勤管理</a></span><br/><span style="color:rgb(164, 164, 164)">员工考勤政策，外出申请</span>
	</div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
       <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('jbgl');" src="<%=basePath%>/images/4.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('jbgl');">加班管理</a></span><br/><span style="color:rgb(164, 164, 164)">加班管理制度，加班申请</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	   <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('xjgl');" src="<%=basePath%>/images/5.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('xjgl');">休假管理</a></span><br/><span style="color:rgb(164, 164, 164);display:block;line-height: 14px;width: 118px;margin-left: 28px;">年假信息，休假申请休假政策，休假公告</span>
	</div>
	</div>
	<div style="width:1000px">
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
       <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('ccgl');" src="<%=basePath%>/images/6.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('ccgl');">出差管理</a></span><br/><span style="color:rgb(164, 164, 164)">出差管理，出差政策</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
        <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('pxgl');" src="<%=basePath%>/images/7.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('pxgl');">培训管理</a></span><br/><span style="color:rgb(164, 164, 164)">培训记录，在线学习</span>
    </div>
	<div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('zphd');" src="<%=basePath%>/images/8.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('zphd');">招聘活动</a></span><br/><span style="color:rgb(164, 164, 164)">内部招聘，内部推荐</span>
	</div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
        <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="window.open('http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/c/CRC_EP_MENU.CRC_EP_NAVIGATION.GBL?FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_SELF_SERVE.CRC_FLD_SELF_EP_MANAGEMENT.CRC_EP_NAVIGATION_GBL&IsFolder=false&languageCd=ZHS')" src="<%=basePath%>/images/9.png"></div><span style="font-weight: bold;font-size: 15px;"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/c/CRC_EP_MENU.CRC_EP_NAVIGATION.GBL?FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_SELF_SERVE.CRC_FLD_SELF_EP_MANAGEMENT.CRC_EP_NAVIGATION_GBL&IsFolder=false&languageCd=ZHS" target="_blank">绩效管理</a></span><br/><span style="color:rgb(164, 164, 164)">员工绩效平台</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('fybx');" src="<%=basePath%>/images/10.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('fybx');">费用报销</a></span><br/><span style="color:rgb(164, 164, 164)">费用报销</span>
	</div>
	</div>
</div>
</div>
<div class="total2" style="display:none;margin:auto;left:0; right:0; top:0; bottom:0;height:545px;width:1060px;background-color:white; ">
  <div class="xh" >
  <div class="xhlist">
    <div class="xhlist_tab">
      <div id="detailDiv"></div>
      <div class="del2" style="float:right" onclick="closeMask();"> </div>
    </div>
    <div class="xhlist_cont">
        
    </div>
  </div>
  <div id="iframediv" style="width:1060px;height:490px">
			<div id="rightlink"
				style="display:none;width: 261px; height: 400px; position: absolute; right: 36px; top: 83px; border: 1px solid rgb(206, 203, 203);">
				<div
					style="width: 240px; height: 133px; float: left; margin-top: 31px; margin-left: 20px;">
					<div style="width: 50px; height: 50px; float: left;">
						<img src="<%=basePath%>/images/feiyong.png" height="50" width="50">
					</div>
					<span
						style="display: block; float: left; font-weight: bold; font-size: 15px; margin-left: 15px;"><a
						id="fybx1" href="" target="_black">费用报销申请</a></span><br>
					<span
						style="display: block; float: left; font-size: 13px; margin-left: 15px;">点击申请日常的费用报销</span>
				</div>
				<div
					style="width: 240px; height: 133px; float: left; margin-left: 20px;">
					<div style="width: 50px; height: 50px; float: left;">
						<img src="<%=basePath%>/images/chailv.png" height="50" width="50">
					</div>
					<span
						style="display: block; float: left; font-weight: bold; font-size: 15px; margin-left: 15px;"><a
						id="fybx2" href="" target="_black">差旅报销申请</a></span><br>
					<span
						style="display: block; float: left; font-size: 13px; margin-left: 15px;">点击申请差旅相关的费用报销</span>
				</div>
				<div
					style="width: 240px; height: 133px; float: left; margin-left: 20px;">
					<div style="width: 50px; height: 50px; float: left;">
						<img src="<%=basePath%>/images/yidi.png" height="50" width="50">
					</div>
					<span
						style="display: block; float: left; font-weight: bold; font-size: 15px; margin-left: 15px;"><a
						id="fybx3"  target="_black">异地福利报销申请</a></span><br>
					<span
						style="display: block; float: left; font-size: 13px; margin-left: 15px;">点击申请异地福利相关的报销</span>
				</div>
			</div>
			<!-- 文本显示iframe -->
   <iframe  id="iframemy" frameborder="0" scrolling="auto" width="1060" height="500" src="" ></iframe>
  </div>
 <!--  休假管理隐藏div -->
  <div id="persondiv" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color: white;">

    <div class="imgdiv" style="width:1000px;margin-left:26px">
          <div class="latest3" style="background-color:white;" >
					<div class="pic3" style="margin-top:-5px"><img id="hrph2"src="" onerror="javascript:this.src='<%=basePath%>css/crcportal_personnel.jpg';" height="120" width="95"></div>
					<div class="job" style="float:left;width:247px">
					  <span id="name2" style="margin-left:10px;font-size:14px;font-weight:bold;margin-top:6px"></span><br/>
					  <span style="font-size: 13px;margin-left:10px" id="dept2" ></span><br/>
					  <span id="job2" style="font-size: 13px;margin-left:10px"></span><br/>
					  
					</div>
						<div class="holidayd" style="display:none" >
							<div style="width: 650px; height: 20px;margin-top: 29px; float: left;">
								<!-- <span
									style="display: block; width: 80px; float: left; margin-left: 43px;">2015</span><span
									style="display: block; width: 80px; float: left; margin-left: 62px; color: rgb(76, 117, 216);">去年</span> -->
									<span id="yearHoli"
									style="display: block; width: 80px; float: left; margin-left: 79px;"></span><span
									style="display: block; width: 80px; float: left; color: #333; margin-left: 57px;"></span>
							</div>
							<div style="width: 650px; height: 30px; float: left;">
								<span style="display: block; float: left">年假</span>
								<!-- <div
									style="width: 300px; height: 25px; float: left; background-color: rgb(245, 161, 27); margin-left: 10px; border-top-left-radius: 5px; border-bottom-left-radius: 5px; color: white;">
									<span style="margin-top: 1px; display: block;">已休10.0天</span>
								</div> -->
								<div
									style="width: 150px; height: 25px; background-color: rgb(178, 186, 177); float: left; margin-left: 1px; border-bottom-right-radius: 5px; border-top-right-radius: 5px; color: #333;">
									<div id="yixiu"
										style="float: left;width:75px; height: 25px; background-color: rgb(178, 186, 177); border-bottom-right-radius: 5px; border-top-right-radius: 5px; color: #333;"></div>
									<div id="shengyu" style="float:left;width:75px;"><span id="shengyunum" style="float: right; margin-top: 1px;"></span>
									</div>
								</div>
							</div>
							<!-- <div
								style="width: 638px; height: 65px; float: left; margin-top: 8px; border: 1px solid rgb(206, 203, 203);">
								<div style="width: 638px; height: 65px; float: left;">
									<div
										style="width: 638px; height: 30px; background-color: rgb(219, 219, 237);">2016年度已休假</div>
									<div style="width: 638px; height: 30px;">
										<span style="float: left; display: block;">年假</span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;">2</span><span
											style="float: left; display: block;">事假</span> <span
											style="width: 55px; float: left; display: block; margin-left: 10px;">3</span>
										<span style="float: left; display: block;">产前检查假</span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;">3</span>
									</div>
								</div>
							</div> -->
						</div>
					</div>
    </div>
	<div class="tabdiv" style="width: 1060px;background-color:white; ">
				
		<div class="effect" style="width:1060px;float:left;margin-top: -17px;margin-left:0px;">
          <div class="jp_tab2" style="float:left;height:285px">
							<table id="pxtableid2" class="jp_tab3" style="margin-left: 25px;width: 1004px;margin-top: 38px;"cellpadding="0" cellspacing="0" border="0">
							  
							</table>
           </div>
           <div id="pagepxid2" style="display:none;float: left; width: 650px; height: 46px;margin-left:75px; margin-top:1px;">
					<span id="cupxPage2" style="float: left; display: block; margin-left: 209px; font-size: 14px;width:55px"></span>
					<span id="topxPage2" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px"></span>
						<a onclick="loadpxPage2('1')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">首页</a>
						<a onclick="loadpxPage2('2')"style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">上一页</a>
						<a onclick="loadpxPage2('3')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">下一页</a>
						<a onclick="loadpxPage2('4')" style="float: left;padding: 1.5px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">尾页</a>
                        <input style="float: left;margin-left:16px;text-align: center;width: 25px; height: 27px; color: rgb(153, 153, 153);" id="jumppxid2" type="text"/>
						<a onclick="loadpxPage2('5')" style="float: left;padding: 1.5px 6px; margin-left:4px; color: blue;">跳转</a>
						
				              </div>
      </div>
				
     	</div>
	
</div>
  </div>
  <div id="persondiv1" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color: white;">

    <div class="div1" style="margin-top: 2px; height: 494px; overflow-y: scroll;">
					<div class="allSystem3" style="padding-left: 12px;width:1021px;height:144px;border: 0px solid #cecbcb;">
					<div id="calendar2" style="height:704px"></div>
					
									 
					</div>	
	 
	  </div>
	
</div>
  </div>
  <div id="persondiv2" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color:white;">
    <div class="imgdiv" style="width: 660px; margin-left: 26px; float: left;margin-top: 30px;">
          <div class="latest3" style="background-color:white;">
					<div class="pic3" style="margin-top:-5px">
							<img id="hrph1" src="" onerror="javascript:this.src='<%=basePath%>css/crcportal_personnel.jpg';" height="120" width="95">
						</div>
					<div class="job">
					  <span id="psname1" style="margin-left:10px;font-size:14px;font-weight:bold;margin-top:6px"></span><br>				  
					  <span id="psdept1"style="font-size: 13px;margin-left:10px"></span><br>
					  <span id="psjob1"style="font-size: 13px;margin-left:10px"></span><br>
					  
					</div>
				</div>
    </div>
    <div class="imgdiv" style="width: 311px; height: 400px; float: right; margin-right: 37px;margin-top: 30px;">
          <div class="latest3" style="background-color: white; float: left; width: 175px; margin-left: 85px; text-align: center; margin-top: 43px;">
					<div class="pic4" style="margin-top: -14px; height: 61px;">
							<img id="grllps" src="" style="cursor: pointer;" onerror="javascript:this.src='<%=basePath%>css/crcportal_personnel.jpg';" onclick="window.open('http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_ESS_MENU.CRC_PSN_DTL_INFO_N.GBL?languageCd=ZHS')" height="55" width="55">
						</div>
					<div class="job">
					  <span style="font-size: 15px; font-weight: bold; margin-top: 6px;"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_ESS_MENU.CRC_PSN_DTL_INFO_N.GBL?languageCd=ZHS" target="_blank">个人履历查询</a></span><br>
					  <span style="font-size: 13px;">点击查询我的个人全方位信息</span>
					  <br>
					  
					</div>
				</div><div class="latest3" style="background-color: white; float: left; width: 175px; margin-left: 85px; text-align: center; margin-top: 43px;">
					<div class="pic4" style="margin-top: -27px; height: 61px;">
							<img src="<%=basePath%>images/lvli.png" style="cursor: pointer;" onclick="window.open('http://hrms-sso.crc.com.cn/web/#/employee/myEmployee?menuCode=console_myEmployee')" height="55" width="55">
						</div>
					<div class="job">
					  <span style="font-size: 15px; font-weight: bold; margin-top: 6px;">
					  <a href="http://hrms-sso.crc.com.cn/web/#/employee/myEmployee?menuCode=console_myEmployee" target="_blank">个人信息修改</a></span><br>
					  <span style="font-size: 13px;">请定期更新个人的相关信息</span>
					  <br>
					  
					</div>
				</div>
				<div class="latest3" style="background-color: white; float: left; width: 175px; margin-left: 85px; text-align: center; margin-top: 43px;">
					<div class="pic4" style="margin-top: -27px; height: 61px;">
							<img src="<%=basePath%>images/xiugai.png" style="cursor: pointer;" onclick="window.open('http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_WKC_MAIN_CM.GBL?Page=CRC_WKC_MAIN_PG&Action=A&CRC_DATA_TYPE=DT001&CRC_FLOWID=CR005527&SETID=CR005&CRC_WKC_EOAW_ID=NEW&CRC_FLAG=1&languageCd=ZHS')" height="55" width="55">
						</div>
					<div class="job">
					  <span style="font-size: 15px; font-weight: bold; margin-top: 6px;">
					  <a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_WKC_MAIN_CM.GBL?Page=CRC_WKC_MAIN_PG&Action=A&CRC_DATA_TYPE=DT001&CRC_FLOWID=CR005527&SETID=CR005&CRC_WKC_EOAW_ID=NEW&CRC_FLAG=1&languageCd=ZHS" target="_blank">离职申请</a></span><br>
					 
					  <br>
					  
					</div>
				</div>
    </div><div style="width: 660px; margin-left: 26px; border: 0px none;" class="imgdiv">
          <div class="latest3" style="background-color:white;">
					<div class="pic4" style="margin-top: -5px; width: 30px; height: 30px; float: left; margin-left: 10px;">
							<img src="<%=basePath%>images/xin.png" height="30" width="30">
						</div>
					<div style="margin-top: -13px; float: left;" class="job">
					  
					  <span style="font-size: 13px; margin-left: 10px;">你已在华润工作<span id="workyear"></span>年<span id="workmonth"></span>个月，感谢你对华润的辛苦付出！</span><br>
					  <span style="font-size: 13px;margin-left:10px">期待你在华润置地能能实现自己的职业生涯规划，与我们携手，与公司共同成长</span><br>
					  
					</div>
				</div>
    </div><div style="width: 660px; margin-left: 26px; border: 0px none;" class="imgdiv">
          <div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 35px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="psageid"></span><span>岁</span><br><span>年龄</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="experid"></span><span>年</span><br><span>从业经历</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="ourid"></span><span>年</span><br><span>司龄</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="lvlid"></span><span></span><br><span>职级</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 35px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout1id"></span><span>次</span><br><span>调动</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout2id"></span><span>次</span><br><span>晋升</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout3id"></span><span>次</span><br><span>获得奖励</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout4id"></span><span>期</span><br><span>参与培训次数</span>
					
					
				</div>
    </div>
	
	
</div>
  </div>
  <div id="persondiv3" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color: white;">

    <div class="imgdiv" style="width:1000px;margin-left:26px">
					<div class="latest3" style="background-color: white;">


						<div class="pic3" style="margin-top: -5px">
							<img id="hrph3"src=""
								height="120" width="95">
						</div>
						<div class="job" style="float: left; width: 247px">
							<span id="name3"
								style="margin-left: 10px; font-size: 14px; font-weight: bold; margin-top: 6px"></span><br>
							<span id="dept3" style="font-size: 13px; margin-left: 10px"></span><br>
							<span id="job3"style="font-size: 13px; margin-left: 10px"></span><br>

						</div>
						<div class="holidayd">


							<div
								style="width: 638px; height: 95px; float: left; margin-top: 8px; border: 1px solid rgb(206, 203, 203);">
								<div style="width: 638px; height: 95px; float: left;">
									<div
										style="width: 638px; height: 30px; background-color: rgb(219, 219, 237);">培训统计</div>
									<div style="width: 638px; height: 30px;">
										<span style="float: left; display: block;" >已报名培训次数</span><span></span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="ybmnum"></span><span
											style="float: left; display: block;" >已完成培训次数</span> <span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="ywcnum"></span>

									</div>
									<div style="width: 638px; height: 30px;">
										<span style="float: left; display: block;" >优秀学员次数</span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="yxxynum"></span><span
											style="float: left; display: block;" >已完成培训小时数</span> <span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="ywcpxnum"></span>
										<span style="float: left; display: block;">平均得分</span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="pjdfnum"></span>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
	<div class="tabdiv" style="width: 1060px;background-color:white; ">
				
		<div class="effect" style="width:1060px;float:left;margin-top: -17px;margin-left:0px;">
          <div class="jp_tab2" style="height:336px;margin-top:-3px">
							<table id="pxtableid" class="jp_tab3" style="margin-left: 26px;text-align: center;margin-top:24px;width: 1003px;"cellpadding="0" cellspacing="0" border="0">
							  <!-- <tr>
								<th>课程名称</th><th>主要教学方式</th><th>培训类型</th><th>开始日期</th><th>结束日期</th><th>培训学时</th><th>状态</th><th>得分</th><th>优秀学员</th>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr>
							  <tr>
								<td>置地总部领导班</td><td>6-在线学习</td><td>内部培训</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>已完成</td><td>90</td><td>是</td>
							  </tr> -->
							</table>
           </div>
      </div>
				
     	</div>
	<!-- <div id="pagepxid" style="float: left; width: 800px; height: 60px; margin-left: 27px;">
					<span id="cupxPage" style="float: left; display: block; margin-left: 227px; font-size: 14px;width:55px">第1页</span>
					<span id="topxPage" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px">共3页</span>
						<a onclick="loadpxPage('1')" style="padding: 3px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">首页</a>
						<a onclick="loadpxPage('2')" style="padding: 3px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">上一页</a>
						<a onclick="loadpxPage('3')" style="padding: 3px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">下一页</a>
						<a onclick="loadpxPage('4')" style="padding: 3px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">尾页</a>
						<a onclick="loadpxPage('5')" style="padding: 3px 6px; margin-left: 53px; color: blue;">跳转</a>
						<input style="text-align: center;width: 25px; height: 23px; margin-top: -24px; float: right; margin-right: 177px; color: rgb(153, 153, 153);" id="jumppxid" type="text">
				</div> -->
	<div id="pagepxid" style="display:none;float: left; width: 800px; height: 60px;margin-left:90px; margin-top:1px;">
					<span id="cupxPage" style="float: left; display: block; margin-left: 209px; font-size: 14px;width:55px"></span>
					<span id="topxPage" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px"></span>
						<a onclick="loadpxPage('1')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">首页</a>
						<a onclick="loadpxPage('2')"style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">上一页</a>
						<a onclick="loadpxPage('3')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">下一页</a>
						<a onclick="loadpxPage('4')" style="float: left;padding: 1.5px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">尾页</a>
                        <input style="float: left;margin-left:16px;text-align: center;width: 25px; height: 27px; color: rgb(153, 153, 153);" id="jumppxid" type="text"/>
						<a onclick="loadpxPage('5')" style="float: left;padding: 1.5px 6px; margin-left:4px; color: blue;">跳转</a>
						
				</div>
</div>
  </div>
  <div id="persondiv4" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color: white;">

    <div class="imgdiv4" style="float: left;margin-top: 23px;z-index:9;width:1025px;height:475px;margin-left:17px;background-image:url(<%=basePath%>/images/bigbg.jpg);">
         <div style="z-index:10;margin-top:284px;margin-left:314px">        
          <div  style="width:400px;height:42px;"></div>
          <div style="width:400px;height:42px;background:url(<%=basePath%>/images/hrms.png) no-repeat center center" onmouseover="this.style.cursor='pointer'"    onclick="window.open('http://km2.crc.com.cn','_blank'); "></div>
          <div style="width:400px;height:42px;"></div>
         </div>
    </div>
	
	
</div>
  </div>
  <div id="persondiv5" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color: white;">

    <div style="width: 100%; height: 40px; margin-top: -13px">
	   <div style="margin-top: 14px;">
	   
	   <span style="margin-left: 115px; font-size: 17px; margin-top: 3px; display: block; float: left;">职位搜索：</span><input name="fname" style="margin-left: 6px; height: 24px; width: 295px;" type="text"><a href="#"><img src="http://home.crland.cn:80/wps/PA_CrlandHrwork/css/search.png" style="margin-left: 4px; margin-bottom: -6px;"></a>
	   
      
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">工作地点：</span><div><span style="" class="active_h" id="all1"><a onclick="loadZp('all1')">全部</a></span>
	   <span style="" class="leave_h" id="bj"><a onclick="loadZp('bj')">北京</a></span>
	   <span style="" class="leave_h" id="sh"><a onclick="loadZp('sh')">上海</a></span>
	   <span style="" class="leave_h" id="tj"><a onclick="loadZp('tj')">天津</a></span>
	   <span style="" class="leave_h" id="cq"><a onclick="loadZp('cq')">重庆</a></span>
	   <span style="" class="leave_h" id="nj"><a onclick="loadZp('nj')">南京</a></span>
	   <span style="" class="leave_h" id="hz"><a onclick="loadZp('hz')">杭州</a></span>
	   <span style="" class="leave_h" id="jn"><a onclick="loadZp('jn')">济南</a></span>
	   <span style="" class="leave_h" id="sz"><a onclick="loadZp('sz')">深圳</a></span>
	   <span style="" class="leave_h" id="cd"><a onclick="loadZp('cd')">成都</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">职位类别：</span><div><span style="" class="active_h" id="all2"><a onclick="loadZp('all2')">全部</a></span>
	   <span style="" class="leave_h" id="cbzc"><a onclick="loadZp('cbzc')">成本招财类</a></span>
	   <span style="" class="leave_h" id="khfw"><a onclick="loadZp('khfw')">客户服务类</a></span>
	   <span style="" class="leave_h" id="yxgl"><a onclick="loadZp('yxgl')">营销管理类</a></span>
	   <span style="" class="leave_h" id="rsxz"><a onclick="loadZp('rsxz')">人事行政类</a></span>
	   <span style="" class="leave_h" id="sjgl"><a onclick="loadZp('sjgl')">设计管理类</a></span>
	   <span style="" class="leave_h" id="gcgl"><a onclick="loadZp('gcgl')">工程管理类</a></span>
	   <span style="" class="leave_h" id="xxh"><a onclick="loadZp('xxh')">信息化管理类</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">所属机构：</span><div><span style="" class="active_h" id="all3"><a onclick="loadZp('all3')">全部</a></span>
	   <span style="" class="leave_h" id="hrzd"><a onclick="loadZp('hrzd')">华润置地</a></span>
	   <span style="" class="leave_h" id="bjdq"><a onclick="loadZp('bjdq')">北京大区</a></span>
	   <span style="" class="leave_h" id="szdq"><a onclick="loadZp('szdq')">深圳大区</a></span>
	   <span style="" class="leave_h" id="cddq"><a onclick="loadZp('cddq')">成都大区</a></span>
	   <span style="" class="leave_h" id="sydq"><a onclick="loadZp('sydq')">沈阳大区</a></span>
	   <span style="" class="leave_h" id="sddq"><a onclick="loadZp('sddq')">山东大区</a></span>
      </div>
	  </div><div class="tabdiv" style="width: 1060px;background-color:white; ">
				
		<div class="effect" style="width:1060px;float:left;margin-left:0px;">
          <div class="jp_tab2">
							<table class="jp_tab3" style="margin-top:-7px;margin-left: 25px;width: 1004px;" border="0" cellpadding="0" cellspacing="0">
							  <tbody><tr>
								<th>职位名称</th><th>职位类别</th><th>招聘人数</th><th>工作地点</th><th>发布时间</th>
							  </tr>
							  <tr>
								<td>设计主管1</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							   <tr>
								<td>设计主管2</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管3</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管4</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管5</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管6</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管7</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管8</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							</tbody></table>
           </div>
      </div>
				
     	</div>
     	<div id="pagination5" style="width: 300px;margin-left: 373px;overflow: hidden;height: 30px;"></div>
	</div>
	
	
</div>
  </div>
  <div id="persondiv6" style="width:1060px;height:510px;display:none;background-color: white">
  
   <div class="allSystem-content" style="width:1060px;background-color: white;">

    <div style="width: 100%; height: 40px; margin-top: -13px;">
	   <div style="margin-top: 14px;">
	   
	   <span style="margin-left: 115px; font-size: 17px; margin-top: 3px; display: block; float: left;">职位搜索：</span><input name="fname" style="margin-left: 6px; height: 24px; width: 295px;" type="text"><a href="#"><img src="http://home.crland.cn:80/wps/PA_CrlandHrwork/css/search.png" style="margin-left: 4px; margin-bottom: -6px;"></a>
	   
      
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">工作地点：</span><div><span style="" class="active_h" id="all12"><a onclick="loadZp('all12')">全部</a></span>
	   <span style="" class="leave_h" id="bj2"><a onclick="loadZp('bj2')">北京</a></span>
	   <span style="" class="leave_h" id="sh2"><a onclick="loadZp('sh2')">上海</a></span>
	   <span style="" class="leave_h" id="tj2"><a onclick="loadZp('tj2')">天津</a></span>
	   <span style="" class="leave_h" id="cq2"><a onclick="loadZp('cq2')">重庆</a></span>
	   <span style="" class="leave_h" id="nj2"><a onclick="loadZp('nj2')">南京</a></span>
	   <span style="" class="leave_h" id="hz2"><a onclick="loadZp('hz2')">杭州</a></span>
	   <span style="" class="leave_h" id="jn2"><a onclick="loadZp('jn2')">济南</a></span>
	   <span style="" class="leave_h" id="sz2"><a onclick="loadZp('sz2')">深圳</a></span>
	   <span style="" class="leave_h" id="cd2"><a onclick="loadZp('cd2')">成都</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">职位类别：</span><div><span style="" class="active_h" id="all2"><a onclick="loadZp('all2')">全部</a></span>
	   <span style="" class="leave_h" id="cbzc2"><a onclick="loadZp('cbzc2')">成本招财类</a></span>
	   <span style="" class="leave_h" id="khfw2"><a onclick="loadZp('khfw2')">客户服务类</a></span>
	   <span style="" class="leave_h" id="yxgl2"><a onclick="loadZp('yxgl2')">营销管理类</a></span>
	   <span style="" class="leave_h" id="rsxz2"><a onclick="loadZp('rsxz2')">人事行政类</a></span>
	   <span style="" class="leave_h" id="sjgl2"><a onclick="loadZp('sjgl2')">设计管理类</a></span>
	   <span style="" class="leave_h" id="gcgl2"><a onclick="loadZp('gcgl2')">工程管理类</a></span>
	   <span style="" class="leave_h" id="xxh2"><a onclick="loadZp('xxh2')">信息化管理类</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">所属机构：</span><div><span style="" class="active_h" id="all32"><a onclick="loadZp('all32')">全部</a></span>
	   <span style="" class="leave_h" id="hrzd2"><a onclick="loadZp('hrzd2')">华润置地</a></span>
	   <span style="" class="leave_h" id="bjdq2"><a onclick="loadZp('bjdq2')">北京大区</a></span>
	   <span style="" class="leave_h" id="szdq2"><a onclick="loadZp('szdq2')">深圳大区</a></span>
	   <span style="" class="leave_h" id="cddq2"><a onclick="loadZp('cddq2')">成都大区</a></span>
	   <span style="" class="leave_h" id="sydq2"><a onclick="loadZp('sydq2')">沈阳大区</a></span>
	   <span style="" class="leave_h" id="sddq2"><a onclick="loadZp('sddq2')">山东大区</a></span>
      </div>
	  </div><div class="tabdiv" style="width: 1060px;background-color:white; ">
				
		<div class="effect" style="width:1060px;float:left;margin-left:0px;">
          <div class="jp_tab2">
							<table class="jp_tab3" style="margin-top:-7px;margin-left: 25px;width: 1004px;" border="0" cellpadding="0" cellspacing="0">
							  <tbody><tr>
								<th>职位名称</th><th>职位类别</th><th>招聘人数</th><th>工作地点</th><th>发布时间</th>
							  </tr>
							  <tr>
								<td>设计主管1</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							   <tr>
								<td>设计主管2</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管3</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管4</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管5</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管6</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管7</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>设计主管8</td><td>设计管理类</td><td>1</td><td>北京</td><td>2015/10/1</td>
							  </tr>
							</tbody></table>
           </div>
      </div>
				
     	</div>
     	<div id="pagination6" style="width: 300px;margin-left: 373px;overflow: hidden;height: 30px;"></div>
	</div>
	
	
</div>
  </div>
  <div  id="linkDiv"style="width: 1025px; position: absolute;bottom: 0px;z-index: 10000;height: 45px; background-color: white;">
   <div id="widthdiv" style="background-color: rgb(147, 184, 227); float: left; width: 132px; height: 35px; text-align: center;margin-left: 89px;">
   <img src="<%=basePath%>/images/link.png" style="margin-top: 7px;float: left;margin-left: 21px;" height="22" width="22"><span id="spanid" style="display: block;float: left;margin-top: 5px;color: white;font-size: 14px;"><a href="http://hrms-sso.crc.com.cn/web/#/employee/mySalary/mySalaryInfo" target="_blank">工资单查询</a></span></div>
  <div id="widthdiv2" style="background-color: rgb(147, 184, 227); display:none;float: left; width: 132px; height: 35px; text-align: center;margin-left: 89px;">
   <img src="<%=basePath%>/images/link.png" style="margin-top: 7px;float: left;margin-left: 21px;" height="22" width="22"><span id="spanid2" style="display: block;float: left;margin-top: 5px;color: white;font-size: 14px;"></span></div>
  
  <div id="widthdiv3" style="background-color: rgb(147, 184, 227); display:none;float: left; width: 132px; height: 35px; text-align: center;margin-left: 89px;">
   <img src="<%=basePath%>/images/link.png" style="margin-top: 7px;float: left;margin-left: 21px;" height="22" width="22"><span id="spanid3" style="display: block;float: left;margin-top: 5px;color: white;font-size: 14px;"></span></div>
  </div>
</div>

</div>
<input id="oawcsq" type="hidden" value="">
<input id="oajbsq" type="hidden" value="">
<input id="oaxjsq" type="hidden" value="">
<input id="oaccsq" type="hidden" value="">
<input id="oabxsq" type="hidden" value="">
<input id="oapxqx" type="hidden" value="">
<input id="oaycsb" type="hidden" value="">
<input id="oaxjsq2" type="hidden" value="">
<input id="employid" type="hidden" value="">
<input id="222id" type="hidden" value="">
<div class="mask2" style="display:none"></div>