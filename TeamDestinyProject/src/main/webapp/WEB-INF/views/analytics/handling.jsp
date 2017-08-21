<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="../js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script type="text/javascript"> 

$(document).ready(function() {  
   
   //테이블 행 숨기는 기능
    $("#sum_table > tbody > tr:nth-child(n+6)").hide();
    
    //테이블 전체보기 클릭이벤트.
    $("#show_all").click(function() {
        $("#sum_table > tbody > tr").show();
        
        $("#show_sum").show();
        $("#show_all").hide();
        
     });
    
    //테이블 요약보기 클릭이벤트.
    $("#show_sum").click(function() {
       $("#sum_table > tbody > tr:nth-child(n+6)").hide();
       
       $("#show_all").show();
       $("#show_sum").hide();
    });
    
    //결측치 변환 버튼 체크 이벤트
    $('#convert').click(function() {
     var chkVal = [];
     var naToNum = $('#naToNumber').val();
  
     $('input[name=chkColnames]:checked').each(function() {
        chkVal.push($(this).val());
     });        
     
     var chkValue = {chkValue : chkVal};
     var cValue = JSON.stringify(chkValue)
     
   console.log(naToNum);
     
        if($('#ynTo10').is(':checked')) {
           //console.log(JSON.stringify(chkValue));
          $.ajax({
             type: 'POST',
             url: '/destiny/ynto10',
             headers : {
                     'Accept' : 'application/json',
                     'Content-Type' : 'application/json'
                },
             data: cValue,                                             
             success: function(data) {
                var jsondata = JSON.stringify(data);
          
                //jsondata.val();
               // jsondata.key();
  
                $("#resultTemp").text(jsondata);
               /*  for(var i =0; i < jsondata.length; i++){
                	
                	$("#resultTemp").text(jsondata);
                } */               
                
                
              //  $("#sum_table > tbody > tr:nth-child(1) > td:nth-child(4)").text("SIU_CUST_YN");
              //$("#sum_table > tbody > tr > td:nth-child(4)").text("1");
            },
            error : function(error) {
             //  console.log(error);
            }
          })
          //console.log(chkValue);
       }else if($('#nullToN').is(':checked')) {
          $.ajax({
             type: 'POST',
             url: '/destiny/nulltoN',
             headers : {
                   'Accept' : 'application/json',
                   'Content-Type' : 'application/json'
              },
           data: cValue,             
           success: function(data) {
              var jsondata = JSON.stringify(data);
              $("#resultTemp").text(jsondata);
              },
            error : function(error) {
                // console.log(error);
              }
          })
       }else if($('#naTo6').is(':checked')) {
          $.ajax({
             type: 'POST',
             url: '/destiny/nato6',
             headers : {
                   'Accept' : 'application/json',
                   'Content-Type' : 'application/json'
              },
           data: cValue,             
           success: function(data) {
              var jsondata = JSON.stringify(data);
              $("#resultTemp").text(jsondata);
              },
            error : function(error) {
                 console.log(error);
              }
          })
       }else if($('#naToNum').is(':checked')) {
          $.ajax({
             type: 'POST',
             url: '/destiny/natonum',
             headers : {
                   'Accept' : 'application/json',
                   'Content-Type' : 'application/json'
              },
           data: {naToNumber : naToNum,
                  chkValue : cValue,
                  num : $('#naToNumber').val()}, 
           
           success: function(data) {
              var jsondata = JSON.stringify(data);
              $("#resultTemp").text(jsondata);
              },
            error : function(error) {
                 console.log(error);
              }
          })
       
       }else{
          alert('전처리 방법을 선택하세요')
       }        
    });    
    
    $('#convert2').click(function() {
        var chkVal = [];

        $('input[name=chkColnames]:checked').each(function() {
           chkVal.push($(this).val());
        });        
        
        var chkValue = {chkValue : chkVal};
        var cValue = JSON.stringify(chkValue)

           if($('#Min').is(':checked')) {
              //console.log(JSON.stringify(chkValue));
             $.ajax({
                type: 'POST',
                url: '/destiny/minNum',
                headers : {
                        'Accept' : 'application/json',
                        'Content-Type' : 'application/json'
                   },
                data: cValue,                                             
                success: function(data) {
                   var jsondata = JSON.stringify(data); 
                   $("#resultTemp2").text(jsondata);     
               },
               error : function(error) {

               }
             })
           }else if($('#Max').is(':checked')) {
             $.ajax({
                type: 'POST',
                url: '/destiny/maxNum',
                headers : {
                      'Accept' : 'application/json',
                      'Content-Type' : 'application/json'
                 },
              data: cValue,             
              success: function(data) {
                 var jsondata = JSON.stringify(data);
                 $("#resultTemp2").text(jsondata);
                 },
               error : function(error) {
                   // console.log(error);
                 }
             })
          }else if($('#Avg').is(':checked')) {
             $.ajax({
                type: 'POST',
                url: '/destiny/nato6',
                headers : {
                      'Accept' : 'application/json',
                      'Content-Type' : 'application/json'
                 },
              data: cValue,             
              success: function(data) {
                 var jsondata = JSON.stringify(data);
                 $("#resultTemp2").text(jsondata);
                 },
               error : function(error) {
                    console.log(error);
                 }
             })
          }else if($('#기타').is(':checked')) {
             $.ajax({
                type: 'POST',
                url: '/destiny/natonum',
                headers : {
                      'Accept' : 'application/json',
                      'Content-Type' : 'application/json'
                 },
              data: {naToNumber : naToNum,
                     chkValue : cValue,
                     num : $('#naToNumber').val()}, 
              
              success: function(data) {
                 var jsondata = JSON.stringify(data);
                 $("#resultTemp2").text(jsondata);
                 },
               error : function(error) {
                    console.log(error);
                 }
             })
          
          }else{
             alert('전처리 방법을 선택하세요')
          }        
       });    
    
    
 });  
   
</script>



<style type="text/css">

.radiobutton {
	height: 150px;
}

<!-- Fonts -->
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nti100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 100;
}
.nti300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 300;
}
<!-- 레귤러 폰트 -->
.nti400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 400;
}
.nti500 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 500;
}
.nti700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 700;
}
.nti900 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 900;
}

html, body{
position:static;
margin:0;
padding:0;
height:100%;
}

.blank{
margin-top:5px;
margin-bottom:5px;
}

.blank1{
margin-top:10px;
margin-bottom:10px;
}

th {
padding: 5px !important;
}

</style>

<title>데이터 전처리</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
<div class="container" style="font-family:'Noto Sans KR', sans-serif; font-weight:400; color: #1e1e1e;">

<div style="border-bottom: 1px solid #1e1e1e; width:80%">
	<h3>정보</h3>
	</div>
	
	<div class="blank">&nbsp;</div>
	
	<div style="border: 1px solid #1e1e1e; border-radius: 3px; width:80%; ">
		<h4>파일명 : [${fileName}]</h4>
	</div>
	
	<div class="blank">&nbsp;</div>
	
	<div id="show_col_sum">
		<input type="button" id="show_all" value="테이블 전체보기"> <input
			type="button" id="show_sum" value="테이블 요약보기(5행)"
			style="display: none">
	<div style="overflow-x: auto;">
	
	<div class="blank">&nbsp;</div>
	
		<table id="sum_table" border="1">
			<thead>
				<tr>
					<c:forEach var="colName" items="${list.colNames}">
						<c:forEach var="colNameValue" items="${colName}">
							<th style="text-align: center;"><input class="chkCol" name="chkColnames" type="checkbox"
								value="${colName}"> <label class="chkCol"
								for="chkColnames">${colName}</label></th>
						</c:forEach>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="0" end="${fn:length(list.data[0])}">
					<c:if test="${i le 20}">
						<c:set var="row" value="${list.data}" />
						<tr>
							<c:forEach var="data" items="${row}">
								<td>${data[i]}</td>
							</c:forEach>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	
	<br>
	
	<div class="resultTemp col-lg-4 col-md-6 col-sm-6 row">
	
	<div style="border-bottom: 1px solid #1e1e1e; width:80%">
		<h3>결측치</h3>
	</div>
		 <div class="blank">&nbsp;</div>	
		<table class="radiobutton">
			<tr>
				<td style="text-align:left;"><input type="radio" id="ynTo10" name="handling1"
					value="ynTo10" style="margin-right:10px;">ynTo10</td>
			</tr>
			<tr>
				<td style="text-align:left;">&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:left;"><input type="radio" id="nullToN" name="handling1"
					value="nullToN" style="margin-right:10px;">nullToN</td>
			</tr>
			<tr>
				<td style="text-align:left;">&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:left;"><input type="radio" id="naTo6" name="handling1"
					value="naTo6" style="margin-right:10px;">naTo6</td>
			</tr>
			<tr>
				<td style="text-align:left;">&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:left;"><input type="radio" id="naToNum" name="handling1"
					value="naToNum" style="margin-right:10px;">na&nbsp;&nbsp;&nbsp;-></td>
				<td style="text-align:left;">&nbsp;&nbsp;<input type="text" id="naToNumber" style="width:30%; margin-right:10px;"></td>
			</tr>
			<tr>
				<td style="text-align:left;">&nbsp;</td>
			</tr>

		</table>
		
		<table>
			<tr>
				<td><input type="submit" id="convert" value="변환" style="margin-right:5px;"/></td>
				<td><a href="/destiny/upload/list"><input type="button"
						value="취소" /></a></td>
			</tr>
		</table>
	</div> <!-- resultTemp -->
	
	
	<div class="resultTemp2 col-lg-4 col-md-6 col-sm-6 row" align=left>
	
			<div style="border-bottom: 1px solid #1e1e1e; width:80%">
				<h3>이상치</h3>
				</div>
				
				<div class="blank">&nbsp;</div>
				
		<table class="radiobutton">
			<tr>
				<td style="text-align:left;"><input type="radio" name="handling2" id="Min">Min
					
				</td>
				
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:left;"><input type="radio" name="handling2" id="Max">Max</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:left;"><input type="radio" name="handling2" id="Avg">Avg</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:left;"><input type="radio" name="handling2" id="기타">기타
					: <input type="text" style="width:30%; margin-right:10px;"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		
		<table style="text-align:right">
			<tr>
				<td><a href=""><input type="submit" id="convert2" value="변환" /></a></td>
				<td>&nbsp;</td>
				<td><a href="/destiny/upload/list"><input type="button"
						value="취소" /></a></td>
			</tr>
		</table>
		<div class="blank">&nbsp;</div>
	</div>

	<div class="col-lg-12 col-md-12 col-sm-12">
	<a href="/destiny/analytics/restructuring">
		<input type="button" value="다음 단계로" style="margin-left:75%;"/></a>
	</div>		
	
	
</div> <!-- End Container -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>