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
			alert("��û����ӦȨ��222��");
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
    /* ��ѯ������ϸ��Ϣ */
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
					//ȱ��������
					$("#oajbsq").val("http://oasz.crland.cn/szcr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
					$("#oaxjsq").val("http://oasz.crland.cn/szcr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
					$("#oaccsq").val("http://oasz.crland.cn/szcr/xzbg/ccgl_sz.nsf/frmcreatedoc?openform");
					$("#fybx1").attr("href","http://oasz.crland.cn/szcr/fin/fybx_sz.nsf/frmcreatedoc?openform");
					$("#fybx2").attr("href","http://oasz.crland.cn/szcr/fin/clbx_sz.nsf/frmcreatedoc?openform");
					$("#fybx3").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
					}else if("1566544"==topDeptId){//��ҵ���ϴ���
						if("1566605"==twoDeptid){//��ҵ���ϴ����Ӽ��һ��
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
							$("#fybx1").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
							$("#fybx2").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
							$("#fybx3").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
						}
					}else if("9302"==topDeptId){//�õ��ܲ�
					$("#oaycsb").val("http://oahq.crland.cn/croa/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
					$("#oaxjsq2").val("http://oahq.crland.cn/croa/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");

					$("#oapxqx").val("http://oahq.crland.cn/croa/xzbg/pxgl_zb.nsf/frmcreatedoc?openform");
					$("#oawcsq").val("http://oahq.crland.cn/croa/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
					$("#oajbsq").val("http://oahq.crland.cn/croa/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
					$("#oaxjsq").val("http://oahq.crland.cn/croa/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
					/* $("#oaccsq").val("http://oahq.crland.cn/croa/xzbg/ccgl_zb.nsf/frmCreateDoc?openform"); */
					$("#oaccsq").val("http://oahq.crland.cn/croa/xzbg/ccgl_zb.nsf/frmJumpPage?OpenForm");//�³�������������ʾ������
					
					/* $("#fybx1").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmcreatedoc?openform");
					$("#fybx2").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmcreatedoc?openform");
					$("#fybx3").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmcreatedoc?openform"); */
					$("#fybx1").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmJumpPage?OpenForm");
					$("#fybx2").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmJumpPage?OpenForm");
					$("#fybx3").attr("href","http://oahq.crland.cn/croa/fin/fybx_zb.nsf/frmJumpPage?OpenForm");//�·��ñ���������ʾ������
					}else if("1509651"==topDeptId){//��ҵ�ܹ�˾�ܲ�
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
						$("#fybx1").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
						$("#fybx2").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
						$("#fybx3").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
					}
					
					}else if("1566544"==topDeptId){//��ҵ�ز���ҵ���ܲ�
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
					}else if("10359"==topDeptId){//��������
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
							$("#fybx3").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')"); */
							//��ѵȱϯ������룬ȱ
							$("#oapxqx").val("");
							//�������
							$("#oawcsq").val("http://oaln.crland.cn/lncr/xzbg/tms_wcsq.nsf/frmCreateDoc?openform");
							//�Ӱ�����
							$("#oajbsq").val("http://oaln.crland.cn/lncr/xzbg/tms_jbsq.nsf/frmCreateDoc?openform");
							//�ݼ�����
							$("#oaxjsq").val("http://oaln.crland.cn/lncr/xzbg/tms_qjsq.nsf/frmCreateDoc?openform");
							//��������,ȱ
							$("#oaccsq").val("");
							//�쳣�겹
							$("#oaycsb").val("http://oaln.crland.cn/lncr/xzbg/tms_ycsb.nsf/frmCreateDoc?openform");
							//��������
							$("#oaxjsq2").val("http://oaln.crland.cn/lncr/xzbg/tms_xjsq.nsf/frmCreateDoc?openform");
							
							$("#fybx1").attr("href","http://oaln.crland.cn/lncr/cw/ydfybx.nsf/frmcreatedoc?openform");
							$("#fybx2").attr("href","http://oaln.crland.cn/lncr/cw/clfybx.nsf/frmcreatedoc?openform");
							$("#fybx3").attr("onclick","alert('������������δ���ô������̣�����ϵ��λHRȷ�ϣ�')");
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
	/*��ѯTRS�ı���Ϣ�ĸ���*/
	function getXmldata(type){
	$.ajax({
	  url: "/SharedRes/home/crland_home/zdmh/dqmh/"+topDeptId+"/bszq/"+type+"/index.xml",//���������XML�ļ���·��
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
	/*�ݼ�*/
    var HolidayJson;
	var currentpxPage2=1;
	function loadpxPage2(str){
	$("#topxPage2").html("��"+Math.ceil(HolidayJson.length/6)+"ҳ");
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
	  alert("��������ȷ��ҳ����");
	  }
	
	}
	$("#cupxPage2").html("��"+currentpxPage2+"ҳ");
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
    var html='<tr><th style="width:164px">��������</th><th>��ʼ����</th><th style="width:104px">��������</th><th>����</th></tr>';
    console.log("�ݼٵ�json"+HolidayJson);
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
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,н������'"+')">н������</a></h5><h5 class="act" id="bid"><a onclick="changeDiv('+"'bid,��������'"+')">��������</a></h5><h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,��ҵ����'"+')">��ҵ����</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,н������');
	   }
	else if('grsw'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,������Ϣ'"+')">������Ϣ</a></h5><h5 class="act" id="bid"><a  style="display:none" onclick="changeDiv('+"'bid,��ְ����'"+')">��ְ����</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,������Ϣ');
	}
	else if('kqgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,��������'"+')">��������</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,��������');
	}
	else if('jbgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,�Ӱ�����'"+')">�Ӱ�����</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,�Ӱ�����');
	}  
	else if('ccgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,��������'"+')">��������</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,��������');
	}
	else if('fybx'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,���ñ���'"+')">���ñ���</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").show();
	   changeDiv('aid,���ñ���');
	} 
	else if('xjgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,�ҵ��ݼ�'"+')">�ҵ��ݼ�</a></h5><h5 class="act" id="bid"><a onclick="changeDiv('+"'bid,�ݼ�����'"+')">�ݼ�����</a></h5><h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,��˾�ݼٹ���'"+')">��˾�ݼٹ���</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,�ҵ��ݼ�');
	} 
	else if('pxgl'==divtype){
	   getXmldata(divtype);
	   html='<h5 class="vst" id="aid"><a onclick="changeDiv('+"'aid,�ҵ���ѵ��¼'"+')">�ҵ���ѵ��¼</a></h5><h5 class="act" id="bid"><a onclick="changeDiv('+"'bid,����ѧϰ'"+')">����ѧϰ</a></h5><h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,��ѵ��������ϵ'"+')">��ѵ��������ϵ</a></h5><h5 class="act" id="did"><a onclick="changeDiv('+"'did,��ѵ���ɹ���'"+')">��ѵ���ɹ���</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('aid,�ҵ���ѵ��¼');
	}  
	else if('zphd'==divtype){
	   getXmldata(divtype);
	   html=''+
	   '<h5 class="act" id="cid"><a onclick="changeDiv('+"'cid,�ڲ���Ƹ����'"+')">�ڲ���Ƹ����</a></h5><h5 class="act" id="did"><a onclick="changeDiv('+"'did,�ڲ���Ƹ����'"+')">�ڲ���Ƹ����</a></h5><h5 class="act" id="eid"><a onclick="changeDiv('+"'eid,�ڲ��Ƽ�����'"+')">�ڲ��Ƽ�����</a></h5>';
	   $("#detailDiv").html(html);
	   $("#rightlink").hide();
	   changeDiv('cid,�ڲ���Ƹ����');
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
	$("#topxPage").html("��"+Math.ceil(newilearnJson.length/8)+"ҳ");
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
	  alert("��������ȷ��ҳ����");
	  }
	
	}
	$("#cupxPage").html("��"+currentpxPage+"ҳ");
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
    var html='<tr><th style="width:164px">�γ�����</th><th>��Ҫ��ѧ��ʽ</th><th>��ѵ����</th><th>��ʼ����</th><th>��������</th><th style="width:114px">��ѵѧʱ��Сʱ��</th><th style="width:60px">״̬</th><th style="width:60px">�÷�</th><th style="width:60px">����ѧԱ</th></tr>';
    console.log("��ѵmakehtml��json"+newilearnJson);
    if(""!=newilearnJson&newilearnJson!=null){
    
    for(var i=startpxPage-1;i<endpxPage-1;i++){
    
     html+='<tr><td title="'+newilearnJson[i].descr100+'">'+newilearnJson[i].descr100+'</td><td>'+newilearnJson[i].descr1+'</td><td>'+newilearnJson[i].descr2+'</td><td>'+newilearnJson[i].course_start_dt+'</td><td>'+newilearnJson[i].course_end_dt+'</td><td >'+newilearnJson[i].descr30+'</td><td>'+newilearnJson[i].status_descr+'</td><td>'+newilearnJson[i].crc_ableend_scrore+'</td><td >'+newilearnJson[i].college_type+'</td></tr>';
    }
    $("#pxtableid").html(html);
    }
    }
    function getPortalInfo(str){
        /* ��ȡ�Ż�������Ϣ */
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
				console.log("�Ż���Ա��Ϣerror");
				}
			});
    }
	/* ��ʾ�����л� */
	function changeDiv(str2){
	var strl=str2.split(",");
	if(strl.length>1){
	     if('н������'==strl[1]){
	        $("#spanid").html('<a href="http://hrms-sso.crc.com.cn/web/#/employee/mySalary/mySalaryInfo" target="_blank" style="color:white"  >���ʵ���ѯ</a>');
	        $("#persondiv").hide();
	        $("#persondiv1").hide();
	        $("#linkDiv").show();
	     }else if('��������'==strl[1]){
	    
	     if(""==$("#oawcsq").val()){
	     $("#spanid").html('<a  onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white" target="_black" >�������</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oawcsq").val()+'" style="color:white" target="_black" >�������</a>');
	     }
	     if(""==$("#oaycsb").val()){
	 	     $("#spanid2").html('<a  onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white" target="_black" >�쳣�겹</a>');
	 	     }else{
	 	     $("#spanid2").html('<a href="'+$("#oaycsb").val()+'" style="color:white" target="_black" >�쳣�겹</a>');
	 	     }
	      if(""==$("#oaxjsq2").val()){
	 	     $("#spanid3").html('<a  onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white" target="_black" >��������</a>');
	 	     }else{
	 	     $("#spanid3").html('<a href="'+$("#oaxjsq2").val()+'" style="color:white" target="_black" >��������</a>');
	 	     }
	      $("#widthdiv2").show();
	      $("#widthdiv3").show();
	        $("#linkDiv").show();
	     }else if('��ְ����'==strl[1]){
	        $("#spanid").html('<a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_WKC_MAIN_CM.GBL?Page=CRC_WKC_MAIN_PG&Action=A&CRC_DATA_TYPE=DT001&CRC_FLOWID=CR005527&SETID=CR005&CRC_WKC_EOAW_ID=NEW&CRC_FLAG=1&languageCd=ZHS" style="color:white" target="_black" >��ְ����</a>');
	        $("#persondiv2").hide();
	        $("#linkDiv").show();
	     }
	     else if('��������'==strl[1]){
	     if(""==$("#oaccsq").val()){
	      $("#spanid").html('<a onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white"  >��������</a>');
	     }else{
	      $("#spanid").html('<a href="'+$("#oaccsq").val()+'" style="color:white" target="_black" >��������</a>');
	     }
	       
	        $("#linkDiv").show();
	     }
	     else if('������Ϣ'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv2").show();
	        $("#linkDiv").hide();
	         /* ��ȡ�Ż�������Ϣ */
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
				console.log("�Ż���Ա��Ϣerror");
				}
			});
	     }
	     else if('�Ӱ�����'==strl[1]){
	     if(""==$("#oajbsq").val()){
	     $("#spanid").html('<a onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white" >�Ӱ�����</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oajbsq").val()+'" style="color:white" target="_black" >�Ӱ�����</a>');
	     }
	        
	        $("#linkDiv").show();
	     }
	     else if('�ڲ���Ƹ����'==strl[1]){
	        $("#spanid").html('<a href="http://careers.crland.com.hk/internalrecruitment/" style="color:white" target="_black" >�ڲ���Ƹְλ����</a>');
	        $("#widthdiv").css("width","172px");
	        $("#linkDiv").show();
	     }
	     else if('�ڲ��Ƽ�����'==strl[1]){
	        $("#spanid").html('<a href="http://careers.crland.com.hk/internalreferral/" style="color:white" target="_black" >�ڲ��Ƽ�ְλ����</a>');
	        $("#widthdiv").css("width","172px");
	        $("#linkDiv").show();
	     }
	     else if('�ҵ��ݼ�'==strl[1]){
	     if(""==$("#oaxjsq").val()){
	     $("#spanid").html('<a onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white" target="_black" >�ݼ�����</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oaxjsq").val()+'" style="color:white" target="_black" >�ݼ�����</a>');
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
				    $("#yixiu").html("ʣ��"+data[0].hughHas+"��");
				    //document.getElementById("shengyu").style.width=300*parseInt(data[0].hughRest)/total+"px";
				    $("#shengyunum").html("����"+data[0].hughRest+"��");
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
				console.log("�ݼ�error");
				}
			});	
	     }
	     else if('��˾�ݼٹ���'==strl[1]){	   
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
					//alert(homepath);pathȡ�ĵ�ַ��Dismis���jquery1.8��������������ʾ������·����ȡjs����
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
			monthNames:['һ��','����', '����', '����', '����', '����', '����',
 '����', '����', 'ʮ��', 'ʮһ��', 'ʮ����'],
           dayNames: ["����", "��һ", "�ܶ�", "����", "����", "����", "����"],
           dayNamesShort: ["������", "����һ", "���ڶ�", "������", "������", "������", "������"],
           buttonText:{
				 prev:     '����',
				 next:     '����',
				 prevYear: 'ȥ��',
				 nextYear: '����',
				 today:    '����',
				 month:    '��',
				 week:     '��',
				 day:      '��'
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
	     else if('�ҵ���ѵ��¼'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv3").show();
	        $("#persondiv4").hide();
	        $("#linkDiv").hide();
	        /* ��ȡ��ѵ��¼ */
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
				    var a=data.length;//�ѱ�����ѵ��
                    var b=0;//�������ѵ����
                    var c=0;//����ѧԱ����
                    var d=0;//�������ѵСʱ��
                    var e=null;//���пγ̷������
                    for(var i=0;i<data.length;i++){
                    if(data[i].status_descr.indexOf("�����")>=0){
                     b+=1;
                     d+=parseFloat(data[i].descr30);
                    }
                    if(data[i].college_type.indexOf("��")>=0){
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
					/* console.log("��ѵ��¼��"+data); */
				},
				error:function(){
				console.log("��ѵerror");
				}
			});	
	     }
	     else if('����ѧϰ'==strl[1]){
	        $("#iframediv").hide();
	        $("#persondiv4").show();
	        $("#persondiv3").hide();
	        $("#linkDiv").hide();
	     }
	     else if('��ѵ��������ϵ'==strl[1]){
	        $("#iframediv").show();
	        $("#persondiv3").hide();
	        $("#persondiv4").hide();
	        $("#linkDiv").hide();
	     }
	     else if('��ѵ���ɹ���'==strl[1]){
	        if(""==$("#oapxqx").val()){
	     $("#spanid").html('<a onclick="alert(\'������������δ���ô������̣�����ϵ��λHRȷ�ϣ�\')" style="color:white" target="_black" >��ѵȱϯ�������</a>');
	     }else{
	     $("#spanid").html('<a href="'+$("#oapxqx").val()+'" style="color:white" target="_black" >��ѵȱϯ�������</a>');
	    
	     }
	        
	        $("#widthdiv").css("width","172px");
	        $("#iframediv").show();
	        $("#persondiv3").hide();
	        $("#persondiv4").hide();
	        $("#linkDiv").show();
	     }
	     else if('�ڲ���Ƹ'==strl[1]){
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
	      else if('�ڲ��Ƽ�'==strl[1]){
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
	            /* ������Ҫ��TRS�ı���Ϣ */
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
		<span class="selectd">����ר��</span>
		
	</div>
	<div style=" width: 890.2px;border: 1px solid #cecbcb;height: 294px;margin-left: 7px;margin-top: 11px;">
	<div style="width:1000px">
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('grsw');" src="<%=basePath%>/images/1.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('grsw');">��������</a></span><br/><span style="color:rgb(164, 164, 164)">������Ϣ��ѯ/�޸�</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('xcfl');" src="<%=basePath%>/images/2.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('xcfl');">н�긣��</a></span><br/><span style="color:rgb(164, 164, 164);display: block;line-height: 14px;width: 122px;margin-left: 27px;">���ʵ���н�긣�����ߣ���ҵ����</span>
    </div>
	<div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	   <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('kqgl');" src="<%=basePath%>/images/3.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('kqgl');">���ڹ���</a></span><br/><span style="color:rgb(164, 164, 164)">Ա���������ߣ��������</span>
	</div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
       <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('jbgl');" src="<%=basePath%>/images/4.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('jbgl');">�Ӱ����</a></span><br/><span style="color:rgb(164, 164, 164)">�Ӱ�����ƶȣ��Ӱ�����</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	   <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('xjgl');" src="<%=basePath%>/images/5.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('xjgl');">�ݼٹ���</a></span><br/><span style="color:rgb(164, 164, 164);display:block;line-height: 14px;width: 118px;margin-left: 28px;">�����Ϣ���ݼ������ݼ����ߣ��ݼٹ���</span>
	</div>
	</div>
	<div style="width:1000px">
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
       <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('ccgl');" src="<%=basePath%>/images/6.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('ccgl');">�������</a></span><br/><span style="color:rgb(164, 164, 164)">���������������</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
        <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('pxgl');" src="<%=basePath%>/images/7.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('pxgl');">��ѵ����</a></span><br/><span style="color:rgb(164, 164, 164)">��ѵ��¼������ѧϰ</span>
    </div>
	<div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('zphd');" src="<%=basePath%>/images/8.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('zphd');">��Ƹ�</a></span><br/><span style="color:rgb(164, 164, 164)">�ڲ���Ƹ���ڲ��Ƽ�</span>
	</div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
        <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="window.open('http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/c/CRC_EP_MENU.CRC_EP_NAVIGATION.GBL?FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_SELF_SERVE.CRC_FLD_SELF_EP_MANAGEMENT.CRC_EP_NAVIGATION_GBL&IsFolder=false&languageCd=ZHS')" src="<%=basePath%>/images/9.png"></div><span style="font-weight: bold;font-size: 15px;"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/c/CRC_EP_MENU.CRC_EP_NAVIGATION.GBL?FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_SELF_SERVE.CRC_FLD_SELF_EP_MANAGEMENT.CRC_EP_NAVIGATION_GBL&IsFolder=false&languageCd=ZHS" target="_blank">��Ч����</a></span><br/><span style="color:rgb(164, 164, 164)">Ա����Чƽ̨</span>
    </div>
    <div style="width:176px;height:145px;float:left;border: 1px solid #cecbcb;text-align:center">
	    <div style="margin-top:11px"><img width='60' height='60' style="cursor:pointer" onclick="openMask('fybx');" src="<%=basePath%>/images/10.png"></div><span style="font-weight: bold;font-size: 15px;"><a onclick="openMask('fybx');">���ñ���</a></span><br/><span style="color:rgb(164, 164, 164)">���ñ���</span>
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
						id="fybx1" href="" target="_black">���ñ�������</a></span><br>
					<span
						style="display: block; float: left; font-size: 13px; margin-left: 15px;">��������ճ��ķ��ñ���</span>
				</div>
				<div
					style="width: 240px; height: 133px; float: left; margin-left: 20px;">
					<div style="width: 50px; height: 50px; float: left;">
						<img src="<%=basePath%>/images/chailv.png" height="50" width="50">
					</div>
					<span
						style="display: block; float: left; font-weight: bold; font-size: 15px; margin-left: 15px;"><a
						id="fybx2" href="" target="_black">���ñ�������</a></span><br>
					<span
						style="display: block; float: left; font-size: 13px; margin-left: 15px;">������������صķ��ñ���</span>
				</div>
				<div
					style="width: 240px; height: 133px; float: left; margin-left: 20px;">
					<div style="width: 50px; height: 50px; float: left;">
						<img src="<%=basePath%>/images/yidi.png" height="50" width="50">
					</div>
					<span
						style="display: block; float: left; font-weight: bold; font-size: 15px; margin-left: 15px;"><a
						id="fybx3"  target="_black">��ظ�����������</a></span><br>
					<span
						style="display: block; float: left; font-size: 13px; margin-left: 15px;">���������ظ�����صı���</span>
				</div>
			</div>
			<!-- �ı���ʾiframe -->
   <iframe  id="iframemy" frameborder="0" scrolling="auto" width="1060" height="500" src="" ></iframe>
  </div>
 <!--  �ݼٹ�������div -->
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
									style="display: block; width: 80px; float: left; margin-left: 62px; color: rgb(76, 117, 216);">ȥ��</span> -->
									<span id="yearHoli"
									style="display: block; width: 80px; float: left; margin-left: 79px;"></span><span
									style="display: block; width: 80px; float: left; color: #333; margin-left: 57px;"></span>
							</div>
							<div style="width: 650px; height: 30px; float: left;">
								<span style="display: block; float: left">���</span>
								<!-- <div
									style="width: 300px; height: 25px; float: left; background-color: rgb(245, 161, 27); margin-left: 10px; border-top-left-radius: 5px; border-bottom-left-radius: 5px; color: white;">
									<span style="margin-top: 1px; display: block;">����10.0��</span>
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
										style="width: 638px; height: 30px; background-color: rgb(219, 219, 237);">2016������ݼ�</div>
									<div style="width: 638px; height: 30px;">
										<span style="float: left; display: block;">���</span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;">2</span><span
											style="float: left; display: block;">�¼�</span> <span
											style="width: 55px; float: left; display: block; margin-left: 10px;">3</span>
										<span style="float: left; display: block;">��ǰ����</span><span
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
						<a onclick="loadpxPage2('1')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">��ҳ</a>
						<a onclick="loadpxPage2('2')"style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage2('3')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage2('4')" style="float: left;padding: 1.5px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">βҳ</a>
                        <input style="float: left;margin-left:16px;text-align: center;width: 25px; height: 27px; color: rgb(153, 153, 153);" id="jumppxid2" type="text"/>
						<a onclick="loadpxPage2('5')" style="float: left;padding: 1.5px 6px; margin-left:4px; color: blue;">��ת</a>
						
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
					  <span style="font-size: 15px; font-weight: bold; margin-top: 6px;"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_ESS_MENU.CRC_PSN_DTL_INFO_N.GBL?languageCd=ZHS" target="_blank">����������ѯ</a></span><br>
					  <span style="font-size: 13px;">�����ѯ�ҵĸ���ȫ��λ��Ϣ</span>
					  <br>
					  
					</div>
				</div><div class="latest3" style="background-color: white; float: left; width: 175px; margin-left: 85px; text-align: center; margin-top: 43px;">
					<div class="pic4" style="margin-top: -27px; height: 61px;">
							<img src="<%=basePath%>images/lvli.png" style="cursor: pointer;" onclick="window.open('http://hrms-sso.crc.com.cn/web/#/employee/myEmployee?menuCode=console_myEmployee')" height="55" width="55">
						</div>
					<div class="job">
					  <span style="font-size: 15px; font-weight: bold; margin-top: 6px;">
					  <a href="http://hrms-sso.crc.com.cn/web/#/employee/myEmployee?menuCode=console_myEmployee" target="_blank">������Ϣ�޸�</a></span><br>
					  <span style="font-size: 13px;">�붨�ڸ��¸��˵������Ϣ</span>
					  <br>
					  
					</div>
				</div>
				<div class="latest3" style="background-color: white; float: left; width: 175px; margin-left: 85px; text-align: center; margin-top: 43px;">
					<div class="pic4" style="margin-top: -27px; height: 61px;">
							<img src="<%=basePath%>images/xiugai.png" style="cursor: pointer;" onclick="window.open('http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_WKC_MAIN_CM.GBL?Page=CRC_WKC_MAIN_PG&Action=A&CRC_DATA_TYPE=DT001&CRC_FLOWID=CR005527&SETID=CR005&CRC_WKC_EOAW_ID=NEW&CRC_FLAG=1&languageCd=ZHS')" height="55" width="55">
						</div>
					<div class="job">
					  <span style="font-size: 15px; font-weight: bold; margin-top: 6px;">
					  <a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_WKC_MAIN_CM.GBL?Page=CRC_WKC_MAIN_PG&Action=A&CRC_DATA_TYPE=DT001&CRC_FLOWID=CR005527&SETID=CR005&CRC_WKC_EOAW_ID=NEW&CRC_FLAG=1&languageCd=ZHS" target="_blank">��ְ����</a></span><br>
					 
					  <br>
					  
					</div>
				</div>
    </div><div style="width: 660px; margin-left: 26px; border: 0px none;" class="imgdiv">
          <div class="latest3" style="background-color:white;">
					<div class="pic4" style="margin-top: -5px; width: 30px; height: 30px; float: left; margin-left: 10px;">
							<img src="<%=basePath%>images/xin.png" height="30" width="30">
						</div>
					<div style="margin-top: -13px; float: left;" class="job">
					  
					  <span style="font-size: 13px; margin-left: 10px;">�����ڻ�����<span id="workyear"></span>��<span id="workmonth"></span>���£���л��Ի�������ึ����</span><br>
					  <span style="font-size: 13px;margin-left:10px">�ڴ����ڻ����õ�����ʵ���Լ���ְҵ���Ĺ滮��������Я�֣��빫˾��ͬ�ɳ�</span><br>
					  
					</div>
				</div>
    </div><div style="width: 660px; margin-left: 26px; border: 0px none;" class="imgdiv">
          <div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 35px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="psageid"></span><span>��</span><br><span>����</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="experid"></span><span>��</span><br><span>��ҵ����</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="ourid"></span><span>��</span><br><span>˾��</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="lvlid"></span><span></span><br><span>ְ��</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 35px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout1id"></span><span>��</span><br><span>����</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout2id"></span><span>��</span><br><span>����</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout3id"></span><span>��</span><br><span>��ý���</span>
					
					
				</div><div class="latest3" style="background-color: rgb(213, 201, 201); width: 130px; height: 80px; margin-left: 20px; text-align: center; margin-top: 12px; float: left;"><span style="font-size: 21px; color: blue; line-height: 2;" id="cout4id"></span><span>��</span><br><span>������ѵ����</span>
					
					
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
										style="width: 638px; height: 30px; background-color: rgb(219, 219, 237);">��ѵͳ��</div>
									<div style="width: 638px; height: 30px;">
										<span style="float: left; display: block;" >�ѱ�����ѵ����</span><span></span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="ybmnum"></span><span
											style="float: left; display: block;" >�������ѵ����</span> <span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="ywcnum"></span>

									</div>
									<div style="width: 638px; height: 30px;">
										<span style="float: left; display: block;" >����ѧԱ����</span><span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="yxxynum"></span><span
											style="float: left; display: block;" >�������ѵСʱ��</span> <span
											style="width: 55px; float: left; display: block; margin-left: 10px;" id="ywcpxnum"></span>
										<span style="float: left; display: block;">ƽ���÷�</span><span
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
								<th>�γ�����</th><th>��Ҫ��ѧ��ʽ</th><th>��ѵ����</th><th>��ʼ����</th><th>��������</th><th>��ѵѧʱ</th><th>״̬</th><th>�÷�</th><th>����ѧԱ</th>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr>
							  <tr>
								<td>�õ��ܲ��쵼��</td><td>6-����ѧϰ</td><td>�ڲ���ѵ</td><td>2015/10/1</td><td>2015/10/1</td><td>1</td><td>�����</td><td>90</td><td>��</td>
							  </tr> -->
							</table>
           </div>
      </div>
				
     	</div>
	<!-- <div id="pagepxid" style="float: left; width: 800px; height: 60px; margin-left: 27px;">
					<span id="cupxPage" style="float: left; display: block; margin-left: 227px; font-size: 14px;width:55px">��1ҳ</span>
					<span id="topxPage" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px">��3ҳ</span>
						<a onclick="loadpxPage('1')" style="padding: 3px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">��ҳ</a>
						<a onclick="loadpxPage('2')" style="padding: 3px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage('3')" style="padding: 3px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage('4')" style="padding: 3px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">βҳ</a>
						<a onclick="loadpxPage('5')" style="padding: 3px 6px; margin-left: 53px; color: blue;">��ת</a>
						<input style="text-align: center;width: 25px; height: 23px; margin-top: -24px; float: right; margin-right: 177px; color: rgb(153, 153, 153);" id="jumppxid" type="text">
				</div> -->
	<div id="pagepxid" style="display:none;float: left; width: 800px; height: 60px;margin-left:90px; margin-top:1px;">
					<span id="cupxPage" style="float: left; display: block; margin-left: 209px; font-size: 14px;width:55px"></span>
					<span id="topxPage" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px"></span>
						<a onclick="loadpxPage('1')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">��ҳ</a>
						<a onclick="loadpxPage('2')"style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage('3')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage('4')" style="float: left;padding: 1.5px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">βҳ</a>
                        <input style="float: left;margin-left:16px;text-align: center;width: 25px; height: 27px; color: rgb(153, 153, 153);" id="jumppxid" type="text"/>
						<a onclick="loadpxPage('5')" style="float: left;padding: 1.5px 6px; margin-left:4px; color: blue;">��ת</a>
						
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
	   
	   <span style="margin-left: 115px; font-size: 17px; margin-top: 3px; display: block; float: left;">ְλ������</span><input name="fname" style="margin-left: 6px; height: 24px; width: 295px;" type="text"><a href="#"><img src="http://home.crland.cn:80/wps/PA_CrlandHrwork/css/search.png" style="margin-left: 4px; margin-bottom: -6px;"></a>
	   
      
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">�����ص㣺</span><div><span style="" class="active_h" id="all1"><a onclick="loadZp('all1')">ȫ��</a></span>
	   <span style="" class="leave_h" id="bj"><a onclick="loadZp('bj')">����</a></span>
	   <span style="" class="leave_h" id="sh"><a onclick="loadZp('sh')">�Ϻ�</a></span>
	   <span style="" class="leave_h" id="tj"><a onclick="loadZp('tj')">���</a></span>
	   <span style="" class="leave_h" id="cq"><a onclick="loadZp('cq')">����</a></span>
	   <span style="" class="leave_h" id="nj"><a onclick="loadZp('nj')">�Ͼ�</a></span>
	   <span style="" class="leave_h" id="hz"><a onclick="loadZp('hz')">����</a></span>
	   <span style="" class="leave_h" id="jn"><a onclick="loadZp('jn')">����</a></span>
	   <span style="" class="leave_h" id="sz"><a onclick="loadZp('sz')">����</a></span>
	   <span style="" class="leave_h" id="cd"><a onclick="loadZp('cd')">�ɶ�</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">ְλ���</span><div><span style="" class="active_h" id="all2"><a onclick="loadZp('all2')">ȫ��</a></span>
	   <span style="" class="leave_h" id="cbzc"><a onclick="loadZp('cbzc')">�ɱ��в���</a></span>
	   <span style="" class="leave_h" id="khfw"><a onclick="loadZp('khfw')">�ͻ�������</a></span>
	   <span style="" class="leave_h" id="yxgl"><a onclick="loadZp('yxgl')">Ӫ��������</a></span>
	   <span style="" class="leave_h" id="rsxz"><a onclick="loadZp('rsxz')">����������</a></span>
	   <span style="" class="leave_h" id="sjgl"><a onclick="loadZp('sjgl')">��ƹ�����</a></span>
	   <span style="" class="leave_h" id="gcgl"><a onclick="loadZp('gcgl')">���̹�����</a></span>
	   <span style="" class="leave_h" id="xxh"><a onclick="loadZp('xxh')">��Ϣ��������</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">����������</span><div><span style="" class="active_h" id="all3"><a onclick="loadZp('all3')">ȫ��</a></span>
	   <span style="" class="leave_h" id="hrzd"><a onclick="loadZp('hrzd')">�����õ�</a></span>
	   <span style="" class="leave_h" id="bjdq"><a onclick="loadZp('bjdq')">��������</a></span>
	   <span style="" class="leave_h" id="szdq"><a onclick="loadZp('szdq')">���ڴ���</a></span>
	   <span style="" class="leave_h" id="cddq"><a onclick="loadZp('cddq')">�ɶ�����</a></span>
	   <span style="" class="leave_h" id="sydq"><a onclick="loadZp('sydq')">��������</a></span>
	   <span style="" class="leave_h" id="sddq"><a onclick="loadZp('sddq')">ɽ������</a></span>
      </div>
	  </div><div class="tabdiv" style="width: 1060px;background-color:white; ">
				
		<div class="effect" style="width:1060px;float:left;margin-left:0px;">
          <div class="jp_tab2">
							<table class="jp_tab3" style="margin-top:-7px;margin-left: 25px;width: 1004px;" border="0" cellpadding="0" cellspacing="0">
							  <tbody><tr>
								<th>ְλ����</th><th>ְλ���</th><th>��Ƹ����</th><th>�����ص�</th><th>����ʱ��</th>
							  </tr>
							  <tr>
								<td>�������1</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							   <tr>
								<td>�������2</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������3</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������4</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������5</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������6</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������7</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������8</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
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
	   
	   <span style="margin-left: 115px; font-size: 17px; margin-top: 3px; display: block; float: left;">ְλ������</span><input name="fname" style="margin-left: 6px; height: 24px; width: 295px;" type="text"><a href="#"><img src="http://home.crland.cn:80/wps/PA_CrlandHrwork/css/search.png" style="margin-left: 4px; margin-bottom: -6px;"></a>
	   
      
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">�����ص㣺</span><div><span style="" class="active_h" id="all12"><a onclick="loadZp('all12')">ȫ��</a></span>
	   <span style="" class="leave_h" id="bj2"><a onclick="loadZp('bj2')">����</a></span>
	   <span style="" class="leave_h" id="sh2"><a onclick="loadZp('sh2')">�Ϻ�</a></span>
	   <span style="" class="leave_h" id="tj2"><a onclick="loadZp('tj2')">���</a></span>
	   <span style="" class="leave_h" id="cq2"><a onclick="loadZp('cq2')">����</a></span>
	   <span style="" class="leave_h" id="nj2"><a onclick="loadZp('nj2')">�Ͼ�</a></span>
	   <span style="" class="leave_h" id="hz2"><a onclick="loadZp('hz2')">����</a></span>
	   <span style="" class="leave_h" id="jn2"><a onclick="loadZp('jn2')">����</a></span>
	   <span style="" class="leave_h" id="sz2"><a onclick="loadZp('sz2')">����</a></span>
	   <span style="" class="leave_h" id="cd2"><a onclick="loadZp('cd2')">�ɶ�</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">ְλ���</span><div><span style="" class="active_h" id="all2"><a onclick="loadZp('all2')">ȫ��</a></span>
	   <span style="" class="leave_h" id="cbzc2"><a onclick="loadZp('cbzc2')">�ɱ��в���</a></span>
	   <span style="" class="leave_h" id="khfw2"><a onclick="loadZp('khfw2')">�ͻ�������</a></span>
	   <span style="" class="leave_h" id="yxgl2"><a onclick="loadZp('yxgl2')">Ӫ��������</a></span>
	   <span style="" class="leave_h" id="rsxz2"><a onclick="loadZp('rsxz2')">����������</a></span>
	   <span style="" class="leave_h" id="sjgl2"><a onclick="loadZp('sjgl2')">��ƹ�����</a></span>
	   <span style="" class="leave_h" id="gcgl2"><a onclick="loadZp('gcgl2')">���̹�����</a></span>
	   <span style="" class="leave_h" id="xxh2"><a onclick="loadZp('xxh2')">��Ϣ��������</a></span>
      </div>
	  </div><div class="" style="margin-top: 14px; float: left; width: 1000px;">
	   
	   <span style="margin-left: 25px; float: left; display: block;">����������</span><div><span style="" class="active_h" id="all32"><a onclick="loadZp('all32')">ȫ��</a></span>
	   <span style="" class="leave_h" id="hrzd2"><a onclick="loadZp('hrzd2')">�����õ�</a></span>
	   <span style="" class="leave_h" id="bjdq2"><a onclick="loadZp('bjdq2')">��������</a></span>
	   <span style="" class="leave_h" id="szdq2"><a onclick="loadZp('szdq2')">���ڴ���</a></span>
	   <span style="" class="leave_h" id="cddq2"><a onclick="loadZp('cddq2')">�ɶ�����</a></span>
	   <span style="" class="leave_h" id="sydq2"><a onclick="loadZp('sydq2')">��������</a></span>
	   <span style="" class="leave_h" id="sddq2"><a onclick="loadZp('sddq2')">ɽ������</a></span>
      </div>
	  </div><div class="tabdiv" style="width: 1060px;background-color:white; ">
				
		<div class="effect" style="width:1060px;float:left;margin-left:0px;">
          <div class="jp_tab2">
							<table class="jp_tab3" style="margin-top:-7px;margin-left: 25px;width: 1004px;" border="0" cellpadding="0" cellspacing="0">
							  <tbody><tr>
								<th>ְλ����</th><th>ְλ���</th><th>��Ƹ����</th><th>�����ص�</th><th>����ʱ��</th>
							  </tr>
							  <tr>
								<td>�������1</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							   <tr>
								<td>�������2</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������3</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������4</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������5</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������6</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������7</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
							  </tr>
							  <tr>
								<td>�������8</td><td>��ƹ�����</td><td>1</td><td>����</td><td>2015/10/1</td>
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
   <img src="<%=basePath%>/images/link.png" style="margin-top: 7px;float: left;margin-left: 21px;" height="22" width="22"><span id="spanid" style="display: block;float: left;margin-top: 5px;color: white;font-size: 14px;"><a href="http://hrms-sso.crc.com.cn/web/#/employee/mySalary/mySalaryInfo" target="_blank">���ʵ���ѯ</a></span></div>
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