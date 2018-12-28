<%@page session="false" contentType="text/html" pageEncoding="GB18030"
	import="java.util.*,javax.portlet.*,com.ibm.crlandhrwork.*"%>
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
<script type="text/javascript">
var  path='<%=basePath%>';
var  uid='<%=request.getUserPrincipal().getName().toLowerCase()%>';
var  homepath='<%=homePath%>';
</script>
<style>
#container{
margin-top:0px;
background: white;
}

</style>
<script type="text/javascript">
     $(document).ready(function() {
			$("#URLID a").click(function(){
			if(''==$(this).attr("name")||null==$(this).attr("name")){
			alert("��û����ӦȨ�ޣ�");
			}else{
			window.open($(this).attr("name"));
        }

	});
	$("#URLID img").click(function(){
			if(''==$(this).attr("name")||null==$(this).attr("name")){
			alert("��û����ӦȨ�ޣ�");
			}else{
			window.open($(this).attr("name"));
        }

	});
	});
     $(function(){
		loadDetail();
		/* getHrDistribute('201608'); */
		
		
});
    $(document).ready(function(){
      $('#ymselect').change(function(){
    findHrTotalCount($(this).children('option:selected').val(),$('#ytselect').children('option:selected').val());
    getHrMonitor($(this).children('option:selected').val(),$('#ytselect').children('option:selected').val());
    
     });
     $('#ytselect').change(function(){
    findHrTotalCount($('#ymselect').children('option:selected').val(),$(this).children('option:selected').val());
    getHrMonitor($('#ymselect').children('option:selected').val(),$(this).children('option:selected').val());
    
     });
     }); 
    var topDeptId="";
    var xmldata="";
    var name="";
    var dept="";
    var hrpic="";
    /* ��ѯ������ϸ��Ϣ */
	function loadDetail(){
	
			$.ajax({
			url : "/wps/CrcPortalWS/services/emp/findEmpDetail",
			type:"get",
			async: false,
			data:{"userLoginID":"<%=request.getUserPrincipal().getName()%>" },
			success : function(json) {
			        var useridid='<%=request.getUserPrincipal().getName()%>';
                    //console.log(json);
					topDeptId=json.topDeptId;
					name=json.empName;
					dept=json.topDeptDesc+"-"+json.twoDeptDesc;
					hrpic=json.currentHrEmpId;
					
					////console.log(json);
					$("#employid").val(json.currentHrEmpId);
					var hradress=homepath+"/SharedRes/appimages/hrphoto/"+json.empUid+hrpic+".jpg";
		            $("#namehr").html(name);
		            $("#depthr").html(dept);
		            $("#hrphhr").attr("src",hradress);
		            getPortalInfo(json.currentHrEmpId);
		            getHrLink(useridid.toUpperCase());
					
					getHrDistribute(json.currentHrEmpId,'L','age');
					getHrDistribute(json.currentHrEmpId,'C','age');
					getHrDistribute(json.currentHrEmpId,'P','age');
					getHrDistribute(json.currentHrEmpId,'L','ourage');
					getHrDistribute(json.currentHrEmpId,'C','ourage');
					getHrDistribute(json.currentHrEmpId,'P','ourage');
					getHrDistribute(json.currentHrEmpId,'L','level');
					getHrDistribute(json.currentHrEmpId,'C','level');
					getHrDistribute(json.currentHrEmpId,'P','level');
					findProDeptList(json.currentHrEmpId,useridid.toUpperCase());//��ȡ����רҵ��ά�б�����
		      },
				error : function() {
					//alert("error2");
				}
			});

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
					$("#hrname1").html(data[0].name);
					$("#hrjob1").html(data[0].job);
					$("#hrdept1").html(data[0].dept);
					
					var hrpic="<%=request.getUserPrincipal().getName().toLowerCase()%>";
					var hradress=homepath+"/SharedRes/appimages/hrphoto/"+hrpic+data[0].employeeId+".jpg";;
		            $("#hrpic1").attr("src",hradress);
		            //alert(data[0].deptType);
		            getHrRemind(str,'srtx',data[0].deptType);
					getHrRemind(str,'sxdq',data[0].deptType);
					getHrRemind(str,'htdq',data[0].deptType);
					getHrRemind(str,'txtx',data[0].deptType);
					}
					console.log(data);
				},
				error:function(){
				//console.log("�Ż���Ա��Ϣerror");
				}
			});
    }
    /* ��ȡ����רҵ�б�ֲ� */
    function findProDeptList(str,str1){
        /* ��ȡ�Ż�������Ϣ */
	        $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findProDeptList",
				type:"POST",
				data:{employid:str,oprid:str1},
				dataType:"json",
				success:function(data){
					//console.log(data[0].type1.split(",").length);
					//console.log(data[0].type2.split(",").length);
					//console.log(data);
					if(data.length>0){
				    $("#displayid1").show();
				    $("#jumppxid1").val("");
                    deptProJson=data;
                    loadpxPage1('1');
					//console.log(data);
					}else{
					deptProJson=null;
					//$("#waitid").hide();
					$("#hrtbid1").html("");
					}
				},
				error:function(){
				//console.log("��ȡ����רҵ�б�ֲ�error");
				}
			});
    }
    /* ��ְ�ְ����Ŷ�ά��ҳ */
    var deptProJson;
	var currentpxPage1=1;
	function loadpxPage1(str){
	//$("#waitid").show();
	$("#topxPage1").html("��"+Math.ceil(deptProJson.length/8)+"ҳ");
	if("1"==str){
	  currentpxPage1=1;
	}else if("2"==str){
	  if(currentpxPage1>1){
	  currentpxPage1--;}
	}else if("3"==str){
	  if(currentpxPage1<Math.ceil(deptProJson.length/8)){
	  currentpxPage1++;}

	}else if("4"==str){
	  currentpxPage1=Math.ceil(deptProJson.length/8);
	}else{
	  var numpxPage1=$("#jumppxid1").val();
	  if(!isNaN(numpxPage1)&&numpxPage1<Math.ceil(deptProJson.length/8)+1){
	    currentpxPage1=$("#jumppxid1").val();
	  }else{
	  alert("��������ȷ��ҳ����");
	  }
	
	}
	$("#cupxPage1").html("��"+currentpxPage1+"ҳ");
	var startpxPage1=1+(currentpxPage1-1)*8;
	var ppggpx1=deptProJson.length%8;
	var endpxPage1;
	endpxPage1=1+currentpxPage1*8;

	if(0!=ppggpx1&&currentpxPage1==Math.ceil(deptProJson.length/8)){
	  endpxPage1=startpxPage1+deptProJson.length%8;
	}
	//console.log(startpxPage1,endpxPage1);
	makepxhtml1(startpxPage1,endpxPage1);
	}
	function makepxhtml1(startpxPage1,endpxPage1){
	var html="<tr><th style='width:180px'>רҵ</th>";
	var proStr=deptProJson[0].type2.split(",");//�ָ�ĸ���רҵ
	for(var k=0;k<deptProJson[0].type2.split(",").length;k++){
	html+="<th style='width:90px' title='"+proStr[k]+"'>"+proStr[k]+"</th>";
	}
	html+="</tr>";
    if(""!=deptProJson&deptProJson!=null){
    
    for(var i=startpxPage1-1;i<endpxPage1-1;i++){
    var proCount=deptProJson[i].type1.split(",");
     html+='<tr><td>'+deptProJson[i].distributeType+'</td>';
     for(var j=0;j<deptProJson[0].type1.split(",").length;j++){
	   html+="<td>"+proCount[j]+"</td>";
	}
	html+="</tr>";
    }
    $("#hrtbid1").html(html);
    //$("#waitid1").hide();
    }
    }
    /* HR��ҳ */
    var newhrJson;
	var currentpxPage=1;
	function loadpxPage(str){
	$("#waitid").show();
	$("#topxPage").html("��"+Math.ceil(newhrJson.length/8)+"ҳ");
	if("1"==str){
	  currentpxPage=1;
	}else if("2"==str){
	  if(currentpxPage>1){
	  currentpxPage--;}
	}else if("3"==str){
	  if(currentpxPage<Math.ceil(newhrJson.length/8)){
	  currentpxPage++;}

	}else if("4"==str){
	  currentpxPage=Math.ceil(newhrJson.length/8);
	}else{
	  var numpxPage=$("#jumppxid").val();
	  if(!isNaN(numpxPage)&&numpxPage<Math.ceil(newhrJson.length/8)+1){
	    currentpxPage=$("#jumppxid").val();
	  }else{
	  alert("��������ȷ��ҳ����");
	  }
	
	}
	$("#cupxPage").html("��"+currentpxPage+"ҳ");
	var startpxPage=1+(currentpxPage-1)*8;
	var ppggpx=newhrJson.length%8;
	var endpxPage;
	endpxPage=1+currentpxPage*8;

	if(0!=ppggpx&&currentpxPage==Math.ceil(newhrJson.length/8)){
	  endpxPage=startpxPage+newhrJson.length%8;
	}
	//console.log(startpxPage,endpxPage);
	//console.log("HR"+newhrJson[0].employid);
	makepxhtml(startpxPage,endpxPage);
	}
	function makepxhtml(startpxPage,endpxPage){
    var html='<tr><th>����</th><th>��ǰ����</th><th>�ڼ���ְ</th><th>�ڼ���ְ</th><th>�ڼ����/���/�ָ�</th><th>��ְ��</th></tr>';
    //console.log("HRjson"+newhrJson);
    if(""!=newhrJson&newhrJson!=null){
    
    for(var i=startpxPage-1;i<endpxPage-1;i++){
     html+='<tr><td  title="'+newhrJson[i].deptdescr+'">'+newhrJson[i].deptdescr+'</td><td>'+newhrJson[i].crc_count1+'</td><td>'+newhrJson[i].crc_count2+'</td><td>'+newhrJson[i].crc_count3+'</td><td>'+newhrJson[i].crc_count4+'</td><td>'+parseFloat(newhrJson[i].rate).toFixed(2)+'%</td>';
    }
    $("#hrtbid").html(html);
    $("#waitid").hide();
    }
    }
     /*  ��ȡ��ذ�ͳ������ */
    function getHrMonitor(str,str1){
         $("#waitid").show();
         $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findHrCount",
				type:"POST",
				data:{userid:"<%=request.getUserPrincipal().getName().toUpperCase()%>",monofyear:str,yt:str1},
				dataType:"json",
				success:function(data){
				//console.log(data);
				if(data.length>0){
				    $("#displayid").show();
				    $("#jumppxid").val("");
                    newhrJson=data;
                    loadpxPage('1');
					//console.log(data);
					}else{
					$("#waitid").hide();
					$("#displayid").hide();
					$("#hrtbid").html("");
					}
				},
				error:function(){
				//console.log("HR��ذ�error");
				}
			});	
    }
    /*  ��ȡ��ذ��ϲ��˵�����ͳ������*/
    function findHrTotalCount(str,str1){
         $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findHrTotalCount",
				type:"POST",
				data:{userid:"<%=request.getUserPrincipal().getName().toUpperCase()%>",monofyear:str,yt:str1},
				dataType:"json",
				success:function(data){
				//console.log(data);
				if(data.length>0){
                    $("#rsnum").html(data[0].crc_count1);
                    $("#rznum").html(data[0].crc_count2);
                    $("#lznum").html(data[0].crc_count3);
                    $("#ydnum").html(data[0].crc_count4);
                    $("#lzlnum").html(parseFloat(data[0].rate).toFixed(2)+"%");
					}else{
					$("#rsnum").html("");
                    $("#rznum").html("");
                    $("#lznum").html("");
                    $("#ydnum").html("");
                    $("#lzlnum").html("");
					}
				},
				error:function(){
				//console.log("HR��ذ�˵�����error");
				}
			});	
    }
    /*  HR�������� */
    function getHrRemind(str1,str2,str3){
          $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findRemind",
				type:"POST",
				data:{employid:str1,remindType:str2,deptType:str3},
				dataType:"json",
				success:function(data){
				console.log(data);
                var html="";
                if("srtx"==str2){
                for(var i=0;i<data.length;i++){
                    var brdt=data[i].birthRd;
                    var d=new Date(brdt);
			        d.setDate(d.getDate());
			        var m=d.getMonth()+1;
			        var date1= new Date().getFullYear()+'-'+m+'-'+d.getDate(); 
				    html+='<p style="font-size:14px">'+date1+'��Ա��'+data[i].name+'��'+data[i].employid+'�������գ���ΪԱ������ף����</p>';
					
					}
					$("#abirth").html(html);
					$("#numEntry0").html(data.length);
                }else if("sxdq"==str2){
                for(var i=0;i<data.length;i++){
				    html+='<p style="font-size:14px">Ա��'+data[i].name+'��'+data[i].employid+'�������ڽ���'+data[i].probationRd+'���ڣ��뼰ʱ����������</p>';
					}
					$("#bsydq").html(html);
					$("#numEntry1").html(data.length);
                }
                else if("htdq"==str2){
                for(var i=0;i<data.length;i++){
				    html+='<p style="font-size:14px">Ա��'+data[i].name+'��'+data[i].employid+'����ͬ����'+data[i].contractRd+'���ڣ��뼰ʱ����������</p>';
					}
					$("#chtdq").html(html);
					$("#numEntry2").html(data.length);
                }
                else if("txtx"==str2){
                for(var i=0;i<data.length;i++){
                   var brdt=data[i].retireRd;
                   var d=new Date(brdt);
			       d.setDate(d.getDate());
			       var m=d.getMonth()+1;
			       var date1= d.getFullYear()+60+'-'+m+'-'+d.getDate(); 
			       var date2= d.getFullYear()+50+'-'+m+'-'+d.getDate(); 
                   if("M"==data[i].sex){
				    html+='<p style="font-size:14px">Ա��'+data[i].name+'��'+data[i].employid+'������'+date1+'���ݣ��뼰ʱ����������</p>';
				    }else{
				    html+='<p style="font-size:14px">Ա��'+data[i].name+'��'+data[i].employid+'������'+date2+'���ݣ��뼰ʱ����������</p>';
				    }
					}
					$("#dtxtx").html(html);
					$("#numEntry3").html(data.length);
                }
				},
				error:function(){
				//console.log("HR�������� error");
				}
			});
			/* $.ajax({
			url : "/wps/CrcPortalWS/services/emp/findEmpChain",
			type:"get",
			async: false,
			data:{EmpId:'516598'},
			success : function(json) {
					//console.log("1"+json);
		      },
				error : function() {
					alert("error2");
				}
			}); */
    }
    /* ������Ա��ģ�ֲ� */
    function getHrDistribute(str0,str1,str2){
         $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findDistribute",
				type:"POST",
				data:{employid:str0,distribute:str1,Type:str2},
				dataType:"json",
				success:function(data){
				if(data.length>0){
				    if('L'==str1&&'age'==str2){
				    ViewChart1(data);
				    }else if('C'==str1&&'age'==str2){
				    ViewChart2(data);
				    }else if('P'==str1&&'age'==str2){
				    ViewChart3(data);
				    }else if('L'==str1&&'ourage'==str2){
				    ViewChart4(data);
				    }else if('C'==str1&&'ourage'==str2){
				    ViewChart5(data);
				    }else if('P'==str1&&'ourage'==str2){
				    ViewChart6(data);
				    }else if('L'==str1&&'level'==str2){
				    ViewChart7(data);
				    }else if('C'==str1&&'level'==str2){
				    ViewChart8(data);
				    }else if('P'==str1&&'level'==str2){
				    ViewChart9(data);
				    }
				    
				    
					//console.log("2sss"+data);
					}else{
					
					}
				},
				error:function(){
				//console.log("������Ա��ģ�ֲ� error");
				}
			});
    }
    /* ��������Ȩ�� */
    function getHrLink(str){
         $.ajax({
				url:"/CrlandPortalDT/RepotApplication/potalwsutil/findLink",
				type:"POST",
				data:{oprid:str},
				dataType:"json",
				success:function(data){
				
				for(var i=0;i<data.length;i++){
				/* ע���������������Ĵ��� */
				var newUrl="";
				if(data[i].url.indexOf("hrms.crc.com.cn")>=0){
				newUrl=data[i].url.replace("hrms.crc.com.cn","hrms-sso.crc.com.cn");
				} else if(data[i].url.indexOf("hruat.crc.com.cn")>=0){
				newUrl=data[i].url.replace("hruat.crc.com.cn","hruat-sso.crc.com.cn");
				} 
				$("."+data[i].crc_flow_id).attr("name",newUrl);	
				if('CRC001'==data[i].crc_flow_id||'CRC002'==data[i].crc_flow_id||'CRC003'==data[i].crc_flow_id){
				$(".CRC001").attr("name","http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/c/CRC_EOAW_MENU.CRC_GC_MAIN_FLOW.GBL?PORTALPARAM_PTCNAV=CRC_GC_MAIN_FLOW_GBL_1&EOPP.SCNode=HRMS&EOPP.SCPortal=EMPLOYEE&EOPP.SCName=CRC_FLD_EOAW&EOPP.SCLabel=%e4%ba%ba%e4%ba%8b%e6%b5%81%e7%a8%8b&EOPP.SCPTfname=CRC_FLD_EOAW&FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_EOAW.CRC_GC_MAIN_FLOW_GBL_1&IsFolder=false&languageCd=ZHS");	
				}
				}	
				//console.log(data);
				},
				error:function(){
				//console.log("��������Ȩ��error");
				}
			});
    }
</script>
<script type="text/javascript">
    $(function (){
    getXmltrs('rs');
    getXmltrs('jlr');
    getXmltrs('xc');
    getXmltrs('jx');
    getXmltrs('px');
    getXmltrs('zp');
    getPreblem();
    });
    $(function(){
        var date=new Date();
        var html="";
		var strmn="";
		/* ѡ��ǰ���ڵ�ǰ������ */
		for(var i=1;i<7;i++){
		    if(i==1){date.setMonth(date.getMonth());
		    }
		    else{
		    date.setMonth(date.getMonth()-1);
		    }
		    
		    var month=date.getMonth()+1;
		    var year=date.getFullYear();
		    if(month>9){
		    strmn=year+"/"+month;
		    }else{
		    strmn=year+"/0"+month;
		    }
		    if(i==1){
		    /* Ĭ�ϳ�ʼ����ǰ�µ����� */
		    findHrTotalCount(strmn,'QB');
		    getHrMonitor(strmn,'QB');
		    }
			html +='<option value="'+strmn+'">'+year+"��"+month+'��</option>';
		};
		$("#ymselect").html(html);
    })
</script>
<script type="text/javascript">
   /*��ѯ���ⷴ��TRS�ı���Ϣ�ĸ���*/
	function getPreblem(){
	$.ajax({
	  url: "/SharedRes/home/crland_home/tynr/sybz/wtfk/index.xml",//���������XML�ļ���·��
	  dataType:"xml",
	  async: false,
	  success: function(xmls){
	     var html="";
	     $(xmls).find("NOTICE").each(function() {
	     html+='<span style="line-height: 38px; margin-left: 8px; float: left; width: 250px;">'+$(this).children("TITLE").text()+'</span>';
	     });
	     $("#wtfkid").html(html);
	  },
	  error:function() {

	       
	     }
	});
	}
  /*��ѯʹ�ð���TRS�ı���Ϣ�ĸ���*/
	function getXmltrs(type){
	$.ajax({
	  url: "/SharedRes/home/crland_home/tynr/sybz/"+type+"/index.xml",//���������XML�ļ���·��
	  dataType:"xml",
	  async: false,
	  success: function(xml){
	     Xmltrs=xml;
	     /* $(Xmltrs).find("NOTICE").each(function() {  
	        var http=$(this).children("URL").text();
			if("�õ�HRн����ѵ-������ѵ"==$(this).children("TITLE").text()){
			$("#rs1id").attr("href",http); 
			}else if("��������Ϣ�����û������ֲ�"==$(this).children("TITLE").text()){
			$("#jlr1id").attr("href",http); 
			}else if("�õؼ�Ч��Ϣ������ָ��"==$(this).children("TITLE").text()){
			$("#jx1id").attr("href",http); 
			}else if("�õؼ�Ч��Ϣ��Ա�������ֲ�"==$(this).children("TITLE").text()){
			$("#jx2id").attr("href",http); 
			}else if("�õ���ѵ������Ϣ������ָ�������й�˾��"==$(this).children("TITLE").text()){
			$("#px1id").attr("href",http); 
			}else if("�õ���ѵ������Ϣ������ָ����������"==$(this).children("TITLE").text()){
			$("#px2id").attr("href",http); 
			}else if("�õ���ѵ������Ϣ������ָ�����õ�ѧԱ��"==$(this).children("TITLE").text()){
			$("#px3id").attr("href",http); 
			}
			if('xc'==type){
			if("�õ�HRн����ѵ-������ְ"==$(this).children("TITLE").text()){
			$("#xc1id").attr("href",http); 
			}else if("�õ�HRн����ѵ-���е�н"==$(this).children("TITLE").text()){
			$("#xc2id").attr("href",http); 
			}else if("�õ�HRн����ѵ-������ְ"==$(this).children("TITLE").text()){
			$("#xc3id").attr("href",http); 
			}
			else if("�õ�HRн����ѵ-���е���"==$(this).children("TITLE").text()){
			$("#xc4id").attr("href",http); 
			}
			else if("�õ�HRн����ѵ-н�ʲ�������"==$(this).children("TITLE").text()){
			$("#xc5id").attr("href",http); 
			}else if("�õ�HRн����ѵ-�籣�������"==$(this).children("TITLE").text()){
			$("#xc6id").attr("href",http); 
			}
			else if("�õ�HRн����ѵ-���ս�����"==$(this).children("TITLE").text()){
			$("#xc7id").attr("href",http); 
			}else if("�õ�HRн����ѵ-��ڷ�н"==$(this).children("TITLE").text()){
			$("#xc8id").attr("href",http); 
			}else if("�õ�HRн����ѵ-��ش����籣"==$(this).children("TITLE").text()){
			$("#xc9id").attr("href",http); 
			}
			else if("�õ�HRн����ѵ-н����Ŀ�������"==$(this).children("TITLE").text()){
			$("#xc10id").attr("href",http); 
			}
			}
			
			if('zp'==type){
			if("HR����������Դϵͳ��Ƹ�����Ե���Ŀ �û������ֲᣨ���й����)"==$(this).children("TITLE").text()){
			$("#zp1id").attr("href","http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm"); 
			}else if("HR����������Դϵͳ��Ƹ�����Ե���Ŀ �û������ֲᣨԱ����ϵ��)"==$(this).children("TITLE").text()){
			$("#zp2id").attr("href","http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm"); 
			}else if("HR����������Դϵͳ��Ƹ�����Ե���Ŀ �û������ֲᣨ�õ�н���)"==$(this).children("TITLE").text()){
			$("#zp3id").attr("href","http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm"); 
			}
			else if("HR����������Դϵͳ��Ƹ�����Ե���Ŀ �û������ֲᣨ�õ���Ƹ��)"==$(this).children("TITLE").text()){
			$("#zp4id").attr("href","http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm"); 
			}
			else if("HR����������Դϵͳ��Ƹ�����Ե���Ŀ �û������ֲᣨ���ⳡ��˵��)"==$(this).children("TITLE").text()){
			$("#zp5id").attr("href","http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm"); 
			}
			}
		}); */
	  },
	  error:function() {

	       
	     }
	});
	}
  function closeMask3(){
	   $(".mask3").hide();
	   $("#detailDiv2").html("");
	   $("#workdiv1").hide();
	   $("#workdiv2").hide();
	   $("#workdiv3").hide();
	   $(".total3").hide();
	}
  function loadDiv(str){
	   $('#'+str).show();
	   $('#'+str).siblings().hide();
	}
  function loadTab(str){
	   $('#'+str).show();
	   $('#'+str).siblings().hide();
	}
  function openMask3(){
       $(".mask3").show();
       $("#detailDiv2").html('<h5 class="vst" id="aid" style="color: rgb(51, 51, 51);font-size: 14px;">��Ա��ģ�ֲ�</h5>');
       $("#workdiv1").show();
	   $(".total3").show();
  }
  function openMask5(){
       $(".mask3").show();
       $("#detailDiv2").html("");
       $("#workdiv3").show();
	   $(".total3").show();
  }
  function openMask4(){
       html='<h5 class="vst" id="tab1"><a onclick="changetab('+"'tab1'"+')">ʹ�ð���</a></h5><h5 class="act" id="tab2"><a onclick="changetab('+"'tab2'"+')">���ⷴ��</a></h5>';
	   $("#detailDiv2").html(html);
       $(".mask3").show();
       $("#workdiv2").show();
       changetab('tab1');
	   $(".total3").show();
  }
 /*  ����������л� */
  function changetab(str){
      $('#'+str).removeClass().addClass("vst");
	  $('#'+str).siblings().removeClass().addClass("act");
      if("tab1"==str){
         $("#help1").show();
         $("#help2").hide();
      }else{
         $("#help2").show();
         $("#help1").hide();
      }
  }
</script>   
<title>hr����̨1</title>
    <link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>css/head.css" rel="stylesheet" type="text/css">
    <link href="<%=homePath%>/appimages/crc_standard_theme/workspace2/images/logo.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/header.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/allSystemClick.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/la_global.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/sec.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/la_tree.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/benchNew.css">
	<script type="text/javascript" src="<%=basePath%>css/jquery-1.js"></script>
    <script type="text/javascript" src="<%=basePath%>css/sea.js"></script>
    <script type="text/javascript" src="<%=basePath%>css/seajs-style.js"></script>
    <script src="<%=basePath%>css/highcharts.js" charset="GB18030"></script>
    <script type="text/javascript" src="<%=basePath%>js/hrmain.js" charset="GB18030"></script>
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/newsCenter.css">
    <link rel="stylesheet" href="<%=basePath%>css/noticeCenter_.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/allSystem.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/allSystemClick.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/allSystem.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/allSystemClick.css">
    <style>.tab-hide{display:none}.tab-active{display:block}</style>
<script type="text/javascript">
  
</script>
<body class="notie1">
<!-- Header Start -->

<div id="crc_center_middle" style="background-color: rgb(238, 238, 238);">
		
<div style="padding-bottom: 8px;margin-top: 0px;" id="container">
<div style="padding-bottom: 0px;" id="crc_center_scroll_main" class="container">
<div class="main_left">
<div class="component-control"><span id=""></span><section class="ibmPortalControl wpthemeNoSkin a11yRegionTarget" role="region">
     
    <div class="wpthemeOverflowAuto"> 
  	

<div class="newsBox" style="height:156px">
				
				<div class="latestNews" style="background-color:white" >
					<div class="pic" style="margin-top:24px"><img id="hrpic1" src="" onerror="javascript:this.src='<%=basePath%>css/crcportal_personnel.jpg';" width="93" height="109"></div>
					<div class="job">
					  <span id="hrname1" style="margin-left:10px;font-size:14px;font-weight:bold;margin-top:6px"></span><br/>
					  <span id="hrjob1" style="font-size: 13px;margin-left:10px"></span><br/>
					  <span id="hrdept1"style="font-size: 13px;margin-left:10px"></span><br/>
					  <span style="font-weight:bold;font-size: 12px;margin-left:10px;color:#333"><img src="<%=basePath%>css/bit.png" style="margin-bottom:-3px;margin-right:5px"><a onclick="openMask4();">ʹ�ð���</a></span>
					</div>
				</div>
				<div class="newsPageNum"></div>
</div>



			</div>
</section> </div>
<div class="component-control"><span id=""></span><section class="ibmPortalControl wpthemeNoSkin a11yRegionTarget" role="region">
     
    <div class="wpthemeOverflowAuto"> 

<div class="newsBox2" style="margin-top:5px">
				
				<div class="info_list">
                 <ul>   
				<li class="info_li" svalue="level2_7158" style=" margin-left:0px;height:45px;width:100%;background-color: rgba(4, 4, 29, 0.07)"><a href="" class="info_a info_a_sel" style="font-size: 16px;color: #333;">ϵͳģ�����</a></li>
			  
				<li class="info_li" svalue="level2_10874"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_ADJ_MENU.CRC_CENTRE_HR.GBL?FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_HR.CRC_CENTRE_HR_GBL&IsFolder=false&IgnoreParamTempl=FolderPath%2cIsFolder&languageCd=ZHS" class="info_a" target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">��֯���¹���̨</a></li>
			  
				<li class="info_li" svalue="level2_7160"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_ADJ_MENU.CRC_CENTER_GP.GBL?FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_GP_ADJ.CRC_CENTER_GP_GBL&IsFolder=false&IgnoreParamTempl=FolderPath%2cIsFolder&languageCd=ZHS" class="info_a" target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">н��ȱ�ڹ���̨</a></li>
			  
				<li class="info_li" svalue="level2_10875"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD/EMPLOYEE/HRMS/c/CRC_RM_MENU.CRC_RM_NAVIGATION.GBL?PORTALPARAM_PTCNAV=CRC_RM_NAVIGATION_GBL&EOPP.SCNode=HRMS&EOPP.SCPortal=EMPLOYEE&EOPP.SCName=CRC_RM_MANAGEMENT&EOPP.SCLabel=%e6%8b%9b%e8%81%98%e7%ae%a1%e7%90%86&EOPP.SCPTfname=CRC_RM_MANAGEMENT&FolderPath=PORTAL_ROOT_OBJECT.CRC_RM_MANAGEMENT.CRC_RM_NAVIGATION_GBL&IsFolder=falses&languageCd=ZHS" class="info_a" target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">��Ƹ������̨</a></li>
			  
				<li class="info_li" svalue="level2_7164"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=CRC_FLD_EP_BACKGRD_MANAGEMENT&FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_EP_BACKGRD_MANAGEMENT&IsFolder=true&languageCd=ZHS" class="info_a"  target="_blank"><img  class="menu_1"src="<%=basePath%>css/menu1.png">��Ч������̨</a></li>
			  
				<li class="info_li" svalue="level2_10876"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=CRC_FLD_ENTERPRISE_LEARNING&FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_ENTERPRISE_LEARNING&IsFolder=true&languageCd=ZHS" class="info_a"  target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">��ѵ������̨</a></li>
			  
				<li class="info_li" svalue="level2_7419"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=CRC_FLD_MANAGER_MANAGEMENT&FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_MANAGER_MANAGEMENT&IsFolder=true&languageCd=ZHS" class="info_a"  target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">�����˹�����̨</a></li>
			  
				<li class="info_li" svalue="level2_7165"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=CRC_FLD_REPORT&FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_REPORT&IsFolder=true?&languageCd=ZHS" class="info_a"  target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">��������</a></li>
				<li class="info_li" svalue="level2_7165"><a href="http://hrms-sso.crc.com.cn/psp/HRPRD_1/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=CRC_FLD_EOAW&FolderPath=PORTAL_ROOT_OBJECT.CRC_FLD_EOAW&IsFolder=true?&languageCd=ZHS" class="info_a"  target="_blank"><img class="menu_1" src="<%=basePath%>css/menu1.png">������ҳ</a></li>
			  	
                 </ul>
				</div>
</div>



			</div>
</section> </div>
</div> 
<div class="main_right">
<div class="div2"><span></span><section class="ibmPortalControl wpthemeNoSkin a11yRegionTarget" role="region">
    <div class="wpthemeOverflowAuto">
		<div class="noticeBox_">
				<div class="noticeTitle_" >
					<ul>
						<li onclick="loadTab('a')"  class="noticeTitleSelect_" style="background-color:rgb(206, 208, 212)" >��������<b  style="margin-right: 599px; margin-top: 150px; top: -110%; background: rgb(255, 0, 0) none repeat scroll 0% 0%; color: rgb(255, 255, 255); border-radius: 72px; font-size: 12px; line-height: 10px; position: absolute; height: 12px; padding: 5px 3px; width: 20px;" id="numEntry0"></b></li>
						<li onclick="loadTab('b')" style="background-color:rgb(206, 208, 212);margin-left:8px;">���õ�������<b  style="margin-right: 599px; margin-top: 150px; top: -110%; background: rgb(255, 0, 0) none repeat scroll 0% 0%; color: rgb(255, 255, 255); border-radius: 72px; font-size: 12px; line-height: 10px; position: absolute; height: 12px; padding: 5px 3px; width: 20px;" id="numEntry1"></b></li>
						<li  onclick="loadTab('c')" style="background-color:rgb(206, 208, 212);margin-left:8px">��ͬ��������<b  style="margin-right: 599px; margin-top: 150px; top: -110%; background: rgb(255, 0, 0) none repeat scroll 0% 0%; color: rgb(255, 255, 255); border-radius: 72px; font-size: 12px; line-height: 10px; position: absolute; height: 12px; padding: 5px 3px; width: 20px;" id="numEntry2"></b></li>
						<li onclick="loadTab('d')" style="background-color:rgb(206, 208, 212);margin-left:8px">��������<b  style="margin-right: 599px; margin-top: 150px; top: -110%; background: rgb(255, 0, 0) none repeat scroll 0% 0%; color: rgb(255, 255, 255); border-radius: 72px; font-size: 12px; line-height: 10px; position: absolute; height: 12px; padding: 5px 3px; width: 20px;" id="numEntry3"></b></li>
					</ul>
				</div>
				<div class="tab-content" id="remind">
							<div class="tab-pane active" id="a" style="overflow:hidden;height:120.5px;display:block;" >
								<marquee id="abirth" onMouseOut="this.start()"onMouseOver="this.stop()" style="WIDTH: 558px; HEIGHT: 110px" scrollamount="2" direction="up">
		                         </marquee>
		                        
							</div>
							<div class="tab-pane" id="b" style="overflow:hidden;height:120.5px;display:none">
								<marquee id="bsydq"   onMouseOut="this.start()"onMouseOver="this.stop()" style="WIDTH: 558px; HEIGHT: 110px" scrollamount="2" direction="up">
								
								
		                         </marquee>
							</div>
							<div class="tab-pane" id="c" style="overflow:hidden;height:120.5px;display:none">
								<marquee id="chtdq" onMouseOut="this.start()"onMouseOver="this.stop()" style="WIDTH: 558px; HEIGHT: 110px" scrollamount="2" direction="up">
								
								
		                         </marquee>
								
							</div>
							<div class="tab-pane" id="d" style="overflow:hidden;height:120.5px;display:none">
								<marquee id="dtxtx" onMouseOut="this.start()"onMouseOver="this.stop()" style="WIDTH: 558px; HEIGHT: 110px" scrollamount="2" direction="up">
								
								
		                         </marquee>
							</div>
							
						</div>
				
     	</div>
     	
     	
<script type="text/javascript">
	$(".noticeBox_ .noticeTitle_ ul li").click(function(){
		//if($(this).index()!=0){
			$(this).addClass("noticeTitleSelect_").siblings().removeClass("noticeTitleSelect_");
		//}else{
		//	$(this).siblings().removeClass("noticeTitleSelect_");
		//}		
	});





</script>
     	
     	
     	</div>
</section> </div>
<div class="div1"><section class="ibmPortalControl wpthemeNoSkin a11yRegionTarget" role="region">
  <div class="wpthemeOverflowAuto">

<div class="allSystem" >
<div class="allSystem-title">
<strong style="color: #333;"> ���̷������</strong>
</div>
<div class="allSystem-content">

    <div class="effect" style="width:740px;float:left;margin-top: -16px;margin-left:6px;">
          <div class="leftLoop">
            <div class="bd" style="height:320px">
              <div id="URLID" class="tempWrap" style="overflow:hidden; position:relative; width:714px">
			  <ul style="width: 720px; position: relative; overflow: hidden; padding: 0px;" class="picList" id="">
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/sheb9.png" class="CRC004" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC004"  title="">¼����ְ</a></div></li>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/zhuanz1.png" class="CRC005" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC005"  title="">����ת��</a></div></li>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/diaod2.png" class="CRC006" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC006"  title="">����</a></div></li>
			   <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/jied3.png" class="CRC007" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC007"  title="">���</a></div></li>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/lung4.png" class="CRC008" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC008"  title="">�ָ�</a></div></li>
			   <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/jings5.png" class="CRC009" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC009" title="">����</a></div></li>
			  <%-- <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/xingz6.png" width="70" height="70"></div><div class="title_"><a id="CRC010" title="">ְ������</a></div></li> --%>
			 
			  </ul>
			  <ul style="width: 720px; position: relative; overflow: hidden; padding: 0px;margin-top: 6px;" class="picList" id="">
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/zhaop12.png" class="CRC001" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a  class="CRC001" title="">��Ƹ</a></div></li>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/diaoy7.png" class="CRC011" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC011" title="">��н</a></div></li>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/jianz8.png" class="CRC012" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC012" title="">������н</a></div></li>
			  <%--  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/sheb9.png" class="CRC013" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC013" title="">�籣������</a></div></li> --%>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/het10.png" class="CRC014" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC014" title="">��ͬ��ǩ</a></div></li>
			   <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/liz11.png" class="CRC015" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC015" title="">��ְ</a></div></li>
			   <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/sjwh.png" class="CRC019" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC019" title="">����ά��</a></div></li>
			   <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/xtqq.png" class="CRC020" style="cursor: pointer;" width="70" height="70"></div><div class="title_"><a class="CRC020" title="">ϵͳ����</a></div></li>
			  
			  </ul>
			   <ul style="width: 720px; position: relative; overflow: hidden; padding: 0px;margin-top: 6px;" class="picList" id="">
			  
			  <%-- <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/peix13.png" width="70" height="70"></div><div class="title_"><a title="">��ѵ</a></div></li>
			  <li style="float: left;"><div class="pic"><img src="<%=basePath%>images/jix14.png" width="70" height="70"></div><div class="title_"><a title="">��Ч</a></div></li> --%>
			  
			  </ul>
			  </div>
            </div>
          </div>
    </div>
</div>
</div>	
</div>
</section> </div></div>
<div class="foot_nav" style="height:577px" >
  <div class="div1">
	
    <div class="wpthemeOverflowAuto"> 
<div class="allSystem1">
<div class="allSystem-title" style="width: 1013px;margin-left: -5px;margin-top:-5px;">
<strong style="color: #333;">HR���ݼ�ذ�</strong>
<a onclick="openMask3();"  style="font-size: 15px;color: rgb(86, 86, 90);font-weight: bold;float:right;margin-right:25px;padding:10px"><img src="<%=basePath%>css/guanl.png" style="margin-bottom: -5px; margin-right: 4px;" >��Ա��ģ�ֲ�</a>
</div>
    <div style="width:100%;height:40px">
	   <div style="margin-top:14px">
	   <tr>
	   <td><span style="margin-left:15px">ѡ�����ڣ�</span></td>
	   <td><select id="ymselect" style="height:26px"></select></td>
       <td><a href="#"><%-- <img src="<%=basePath%>css/search.png" style="margin-bottom: -6px; margin-left: 12px;" width='20' height='20'> --%></a></td>
	   
      </tr>
      <tr>
	   <td><span style="margin-left:15px">ѡ��ҵ̬��</span></td>
	   <td><select id="ytselect" style="height:26px">
	      <option value ="QB">ȫ��</option>
		  <option value ="L">����</option>
		  <option value ="C">��ҵ</option>
		  <option value ="B">����</option>
		  <option value ="P">��ҵ</option>
		  <option value ="CS">�̷�</option>
		  <option value ="OC">�������</option>
		  <!-- <option value="E">����</option>
		  <option value="U">�Ÿ���</option>
		  <option value="F">���¼�˽</option> -->
		  <option value="I">����</option>
	   </select></td>
       <td><a href="#"><%-- <img src="<%=basePath%>css/search.png" style="margin-bottom: -6px; margin-left: 12px;" width='20' height='20'> --%></a></td>
	   
      </tr>
	  </div>
	</div>
    <div style="width:100%;height:70px">
	<div class="typet" style="margin-left:10px"><li><img src="<%=basePath%>css/ttou.png" ></li><li>��ǰ����<span id="rsnum"></span></li></div>
	<div class="typet"><li><img src="<%=basePath%>css/tjia.png" ></li><li>�ڼ���ְ<span id="rznum"></span></li>
	</div><div class="typet"><li><img src="<%=basePath%>css/tyou.png" ></li><li>�ڼ���ְ<span id="lznum"></span></li></div>
	<div class="typet"><li><img src="<%=basePath%>css/tsuan.png" ></li><li>�ڼ����/���/�ָ�<span id="ydnum"></span></li></div>
	<div class="typet"><li><img src="<%=basePath%>css/tyuan.png" ></li><li>��ְ��<span id="lzlnum"></span></li></div>
	
	</div>
    <div class="effect" style="width:971px;float:left;margin-top: -15px;margin-left:6px;">
          <div class="jp_tab" style="height:376px">
          <div id="waitid" style="width:145px;display:none;position:absolute; left:489px;top:899px">

            <img src="<%=basePath%>images/loading-14.gif" width="40" height="40" />

            </div>
    <table id="hrtbid" class="jp_tabcont" cellpadding="0" cellspacing="0" border="0">
     

    </table>
  </div>
    <div id="pagepxid" style="float: left; width: 800px; height: 39px; margin-top: -2px;">
					<div id="displayid" style="display:none;">
					<span id="cupxPage" style="float: left; display: block; margin-left: 267px; font-size: 14px; width: 55px;"></span>
					<span id="topxPage" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px"></span>
						<a onclick="loadpxPage('1')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">��ҳ</a>
						<a onclick="loadpxPage('2')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage('3')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage('4')" style="float: left;padding: 1.5px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">βҳ</a>
                        <input style="float: left;margin-left:16px;text-align: center;width: 25px; height: 27px; color: rgb(153, 153, 153);" id="jumppxid" type="text">
						<a onclick="loadpxPage('5')" style="float: left;padding: 1.5px 6px; margin-left:4px; color: blue;">��ת</a>
					</div>	
				</div>
    </div>

</div>	
</div>
</div>
</div>
</div>
</div>
</div>
	<div class="total3"
		style="display: none; margin: auto; left: 0; right: 0; top: 0; bottom: 0; height: 545px; width: 1060px; background-color: white;">
		<div class="xh" style="background: white;">
			<div class="xhlist" style="margin-top: -25px;">
				<div class="xhlist_tab">
					<div id="detailDiv2"></div>
					<div class="del2" style="float: right" onclick="closeMask3();">
					</div>
				</div>


			</div>
		</div>

		<div style="padding-bottom: 0px;" id="crc_center_scroll_main"
			class="container">

			<div class="hr2_nav" id="workdiv1" style="display: none">
				<div class="div1">
					<section class="ibmPortalControl wpthemeNoSkin a11yRegionTarget"
						role="region">
						<div class="wpthemeOverflowAuto">





							<div class="allSystem"
								style="width: 999px; border: 0px solid #cecbcb;">


								<div class="nav_left" style="width: 176px">
									<ul>
										<li class="selectd_bg" style="width: 147px"
											onclick="loadDiv('aa')"><a>Ա��ְ���ṹ����</a></li>
										<li onclick="loadDiv('bb')" style="width: 147px"><a>Ա��רҵ�ṹ����</a></li>
										<li onclick="loadDiv('cc')" style="width: 147px"><a>Ա������ṹ����</a></li>
										<li onclick="loadDiv('dd')" style="width: 147px"><a>Ա��˾��ṹ����</a></li>
									</ul>

								</div>


								<div class="tab-content">
									<div class="tab-pane active" id="aa"
										style="display: block; width: 1000px">
										<div id='main1'
											style="width: 270px; height: 320px; float: left"></div>
										<div id='main2'
											style="width: 270px; height: 320px; float: left"></div>
										<div id='main3'
											style="width: 270px; height: 320px; float: left"></div>
									</div>
									<div class="tab-pane" id="bb"
										style="width: 1000px; display: none" >
										<div style="width:783px;overflow-x:scroll;height:391px">
										<table style="width: 783px;" id="hrtbid1" class="jp_tabcont"
											border="0" cellpadding="0" cellspacing="0">
											
										</table>
										</div>
				<div id="pagepxid1" style="float: left; width: 800px; height: 39px; margin-top: 3px;">
					<div id="displayid1" style="display:none;">
					<span id="cupxPage1" style="float: left; display: block; margin-left: 361px; font-size: 14px; width: 55px;"></span>
					<span id="topxPage1" style="float: left; margin-left: 0px; display: block; font-size: 14px;width:55px"></span>
						<a onclick="loadpxPage1('1')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 2px;">��ҳ</a>
						<a onclick="loadpxPage1('2')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage1('3')" style="float: left;padding: 1.5px 6px; border: 1px solid rgb(153, 153, 153); margin-left: 15px;">��һҳ</a>
						<a onclick="loadpxPage1('4')" style="float: left;padding: 1.5px 6px; margin-left: 15px; border: 1px solid rgb(153, 153, 153);">βҳ</a>
                        <input style="float: left;margin-left:16px;text-align: center;width: 25px; height: 27px; color: rgb(153, 153, 153);" id="jumppxid1" type="text">
						<a onclick="loadpxPage1('5')" style="float: left;padding: 1.5px 6px; margin-left:4px; color: blue;">��ת</a>
					</div>	
				</div>
									</div>
									<div class="tab-pane" id="cc"
										style="width: 1000px; display: none">
										<div id='age1'
											style="width: 270px; height: 320px; float: left"></div>
										<div id='age2'
											style="width: 270px; height: 320px; float: left"></div>
										<div id='age3'
											style="width: 270px; height: 320px; float: left"></div>
									</div>
									<div class="tab-pane" id="dd"
										style="width: 1000px; display: none">
										<div id='workex1'
											style="width: 270px; height: 320px; float: left"></div>
										<div id='workex2'
											style="width: 270px; height: 320px; float: left"></div>
										<div id='workex3'
											style="width: 270px; height: 320px; float: left"></div>
									</div>

								</div>
								<script type="text/javascript">
				$(".nav_left ul li").click(function(){
				$(this).addClass("selectd_bg").siblings().removeClass("selectd_bg")
				});
                </script>


							</div>
						</div>

					</section>
				</div>
			</div>

			<div class="hr2_nav" id="workdiv2" style="display: none">
				<div class="div1" id="help1" style="margin-top: -59px">

					<div class="allSystem"
						style="width: 999px; border: 0px solid #cecbcb;">
						<div class="allSystem-title"
							style="width: 1001px; border-bottom: 1px solid rgb(228, 218, 218); background-color: white">
							<div
								style="width: 30px; height: 30px; float: left; margin-top: 9px; padding-right: 8px;">
								<img src="<%=basePath%>images/caozuo.png" width="30" height="30">
							</div>
							<span style="float: left; display: block">�û������ֲ�</span><br>
							<span style="float: left; display: block">UserManual</span>

						</div>
						<div
							style="width: 1001px; height: 36px; float: left; margin-top: 8px;"
							class=""></div>
						<div style="width: 1001px; height: 340px; float: left;" class="">
							<div
								style="width: 110px; height: 42px; float: left; text-align: center; background-color: rgb(228, 218, 218);">
								<span
									style="line-height: 41px; font-size: 15px; font-weight: bold; margin-left: -41px;">����</span>
							</div>
							<div
								style="width: 320px; height: 42px; float: left; border-top: 1px solid rgb(228, 218, 218);">
								<span
									style="margin-top: 11px; display: block; margin-left: 22px; color: blue;"><a
									id="rs1id"
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/rs/" target="_Blank">�õ�HRн����ѵ-������ѵ</a></span>
							</div>


							<div
								style="width: 110px; height: 42px; float: left; text-align: center; background-color: rgb(228, 218, 218);">
								<span
									style="line-height: 42px; font-size: 15px; font-weight: bold; margin-left: -41px;">������</span>
							</div>
							<div
								style="width: 460px; height: 42px; float: left; border-top: 1px solid rgb(228, 218, 218); border-right: 1px solid rgb(228, 218, 218);">
								<span
									style="margin-top: 11px; display: block; margin-left: 22px; color: blue;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/jlr/" id="jlr1id" target="_Blank">��������Ϣ�����û������ֲ�</a></span>
							</div>



							<div
								style="width: 110px; height: 285px; background-color: rgb(228, 218, 218); text-align: center; float: left; margin-top: 1px;">
								<span
									style="line-height: 49px; font-size: 15px; font-weight: bold; margin-left: -41px;">н��</span>
							</div>
							<div id="xceach"
								style="width: 320px; height: 283px; float: left; margin-top: 1px; border-top: 1px solid rgb(228, 218, 218); border-bottom: 1px solid rgb(228, 218, 218);">
								<span
									style="margin-top: 7px; display: block; margin-left: 22px; color: blue;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc1id" target="_Blank">�õ�HRн����ѵ-������ְ</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc2id" target="_Blank">�õ�HRн����ѵ-���е�н</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc3id" target="_Blank">�õ�HRн����ѵ-������ְ</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc4id" target="_Blank">�õ�HRн����ѵ-���е���</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc5id" target="_Blank">�õ�HRн����ѵ-н�ʲ�������</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc6id" target="_Blank">�õ�HRн����ѵ-�籣�������</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc7id" target="_Blank">�õ�HRн����ѵ-���ս�����</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc8id" target="_Blank">�õ�HRн����ѵ-��ڷ�н</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc9id" target="_Blank">�õ�HRн����ѵ-��ش����籣</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/xc/" id="xc10id" target="_Blank">�õ�HRн����ѵ-н����Ŀ�������</a></span>
							</div>


							<div
								style="width: 110px; height: 55px; float: left; text-align: center; background-color: rgb(228, 218, 218); margin-top: 1px;">
								<span
									style="line-height: 49px; font-size: 15px; font-weight: bold; margin-left: -41px;">��Ч</span>
							</div>
							<div
								style="width: 460px; height: 55px; float: left; border-top: 1px solid rgb(228, 218, 218); margin-top: 1px; border-right: 1px solid rgb(228, 218, 218);">
								<span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/jx/" id="jx1id" target="_Blank">�õؼ�Ч��Ϣ������ָ��</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/jx/" id="jx2id" target="_Blank">�õؼ�Ч��Ϣ��Ա�������ֲ�</a></span>
							</div>
							<div
								style="width: 110px; height: 80px; float: left; text-align: center; background-color: rgb(228, 218, 218); margin-top: 1px;">
								<span
									style="line-height: 49px; font-size: 15px; font-weight: bold; margin-left: -41px;">��ѵ</span>
							</div>
							<div
								style="width: 460px; height: 80px; float: left; border-top: 1px solid rgb(228, 218, 218); margin-top: 1px; border-right: 1px solid rgb(228, 218, 218);">
								<span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/px/" id="px1id" target="_Blank">�õ���ѵ������Ϣ������ָ�������й�˾��</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/px/" id="px2id" target="_Blank">�õ���ѵ������Ϣ������ָ����������</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/px/" id="px3id" target="_Blank">�õ���ѵ������Ϣ������ָ�����õ�ѧԱ��</a></span>
							</div>
							<div
								style="width: 110px; height: 146px; float: left; text-align: center; background-color: rgb(228, 218, 218); margin-top: 1px;">
								<span
									style="line-height: 49px; font-size: 15px; font-weight: bold; margin-left: -41px;">��Ƹ</span>
							</div>
							<div id="zpeach"
								style="width: 460px; height: 144px; float: left; border-top: 1px solid rgb(228, 218, 218); margin-top: 1px; border-bottom: 1px solid rgb(228, 218, 218); border-right: 1px solid rgb(228, 218, 218);">
								<span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm" id="zp1id" target="_Blank">CRC HR����������Դϵͳ��Ƹ�����Ե���Ŀ
										�û������ֲᣨ���й���ڣ�</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm" id="zp2id" target="_Blank">CRC HR����������Դϵͳ��Ƹ�����Ե���Ŀ
										�û������ֲᣨԱ����ϵ�ڣ�</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm" id="zp3id" target="_Blank">CRC HR����������Դϵͳ��Ƹ�����Ե���Ŀ
										�û������ֲᣨ�õ�н��ڣ�</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm" id="zp4id" target="_Blank">CRC HR����������Դϵͳ��Ƹ�����Ե���Ŀ
										�û������ֲᣨ�õ���Ƹ�ڣ�</a></span><span
									style="display: block; margin-left: 22px; color: blue; margin-top: 2px;"><a
									style="text-decoration: underline; font-size: 13px; color: blue;"
									href="http://cms.crc.com.cn/preview/crland_home/tynr/sybz/zp/index.htm" id="zp5id" target="_Blank">CRC HR����������Դϵͳ��Ƹ�����Ե���Ŀ
										�û������ֲᣨ���ⳡ����</a></span>
							</div>




						</div>


					</div>

				</div>
				<div class="div1" id="help2" style="margin-top: -59px">
					<div class="allSystem"
						style="width: 999px; border: 0px solid #cecbcb">
						<div class="allSystem-title"
							style="width: 1001px; float: left; background-color: white; border-bottom: 1px solid rgb(228, 218, 218);">
							<div
								style="width: 30px; height: 30px; float: left; margin-top: 9px; padding-right: 8px;">
								<img src="<%=basePath%>images/diannao.png" width="30"
									height="30">
							</div>
							<span style="float: left; display: block">���ⷴ����֧��</span><br>
							<span style="float: left; display: block">SupportCenter</span>

						</div>

						<div
							style="width: 1001px; height: 150px; float: left; margin-top: 8px;"
							class=""></div>
						<div class="allSystem-title"
							style="width: 1001px; background-color: white; float: left;">
							<div
								style="width: 30px; height: 30px; float: left; margin-top: 9px; padding-right: 8px;">
								<img src="<%=basePath%>images/fankui.png" width="30" height="30">
							</div>
							<span style="float: left; display: block">�������ʹ��������Դϵͳ�Ĺ��������κε�������飬����ͨ������QQȺ�ʹ�ҽ��н��������ǵ�ϵͳ��ά��ԱҲ�ἰʱ������</span><br>
							<span style="float: left; display: block">�Ͽ�������ǰɣ�Let's
								Go��</span>

						</div>
						<div
							style="width: 152px; height: 81px; float: left; text-align: center; background-color: rgb(228, 218, 218); margin-top: 25px;">
							<span
								style="line-height: 74px; font-size: 15px; font-weight: bold; margin-left: -13px;">���ⷴ��</span>
						</div>
						<div id="wtfkid"
							style="width: 810px; height: 79px; float: left; text-align: center; margin-top: 25px; border: 1px solid rgb(228, 218, 218);">

						</div>

					</div>

				</div>
			</div>

			<div class="hr2_nav" id="workdiv3" style="display: none">
				<div class="div1" style="margin-top: -59px">

					<div class="allSystem"
						style="width: 999px; border: 0px solid #cecbcb;">sds</div>

				</div>
			</div>

		</div>
	</div>
    <input id="employid" type="hidden" value="">
    <input id="useridid" type="hidden" value="">
	<div class="mask3" style="display:none"></div>
</body>
