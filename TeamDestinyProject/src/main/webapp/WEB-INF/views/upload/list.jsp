<%@ page contentType="text/html; charset=utf-8"
   trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CoderBy</title>
<!-- Favicon -->
<link href="<c:url value='/favicon.png'/>" rel="icon" type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='//code.jquery.com/jquery.min.js'></script>
<script type="text/javascript">
$(document).ready(function() {
    // The event listener for the file upload
    document.getElementById('txtFileUpload').addEventListener('change', upload, false);
    // Method that checks that the browser supports the HTML5 File API
    function browserSupportFileUpload() {
        var isCompatible = false;
        if (window.File && window.FileReader && window.FileList && window.Blob) {
        isCompatible = true;
        }
        return isCompatible;
    }
    // Method that reads and processes the selected file
    function upload(evt) {
    if (!browserSupportFileUpload()) {
        alert('The File APIs are not fully supported in this browser!');
        } else {
            var data = null;
            var file = evt.target.files[0];
            var reader = new FileReader();
            reader.readAsText(file);
            reader.onload = function(event) {
                var csvData = event.target.result;
                data = $.csv.toArrays(csvData);
                if (data && data.length > 0) {
                  alert('Imported -' + data.length + '- rows successfully!');
                } else {
                    alert('No data to import!');
                }
            };
            reader.onerror = function() {
               alert('Unable to read ' + file.fileName);
            };
        }
    }
});
   function myFunction() {
     var file1 = document.querySelector("#txtFileUpload");
     var fileName = file1.value;
     
     var fileExt = fileName.substr(fileName.lastIndexOf("."), 4);
     console.log(fileExt);
     
     var contentArea = document.getElementById("content");
     var table = document.querySelectorAll("#table");
     if(fileExt ==".csv")
     {
        confirm("저장되었습니다.");       
     }
     else         
        alert("csv 파일이 아닙니다! 다시 선택해주세요");
        document.getElementById("myForm").reset();
   }
//------------------------------------------
   $(document).ready(function() {
      $(".delete").click(function() {
         if (confirm("이 작업은 되돌릴 수 없습니다. 파일을 삭제하겠습니까?")) {
            return true;
         } else {
            return false;
         }
      })
   });
	 	
	 function checkSelectedValue(){
       var valueArr = new Array();
       var list = $("input[name='fileId']");
       for(var i = 0; i < list.length; i++){
           if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
               valueArr.push(list[i].id);
           }
       }
       
       //선택된 체크박스의 값을 콘솔에 출력
       var str = '';
       for(var i in valueArr){
           str += valueArr[i]+'&nbsp;&nbsp;&nbsp;&nbsp;';
       }
       $('#dibugConsole').html(str);  
       console.log(str);
   }
   var str2 = '';
   function checkSelectedId(){
       var valueArr = new Array();
          var list = $("input[name='fileId']");
          for(var i = 0; i < list.length; i++){
              if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
                  valueArr.push(list[i].value);
              }
          }
          
          //선택된 체크박스의 값을 콘솔에 출력
          for(var i in valueArr){
             if(i < valueArr.length-1)
                {
                str2 += valueArr[i]+"?";
                }
             else
                str2 += valueArr[i];
          }
          
          location.href = 'http://localhost:8080/destiny/analytics/info/'+str2;
    
   }
   
   
   //--------------------------------------------------
   $(function() {
      //console.log($("[id=popbutton1]"));
      $("[id=popbutton1]").click(function() {
         //jquery로 현재 객체의 data-fileid 속성을 읽어서 변수에 저장하고 그변수를..
         $.ajax({
            type : "GET",
            url : "/destiny/upload/list/"+ $(this).attr("data-fileid"), // 서버측에서 가져올 페이지
//            data: '3',
            timeout : 5000, // 응답대기시간 
            dataType : "jsp", // html , javascript, text, xml, jsonp 등이 있다
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            beforeSend : function() { // ajax 요청하기전에 실행되는 함수??
            },
            success : function(data) { // 정상적으로 완료되었을 경우에 실행된다
               //$('div.modal').modal({
               //   remote : data
               //});
               console.log(data); // data 인수에는 return 되어진 data 가 저장되어 있다
               console.log('/destiny/analytics/info/' + $(this).attr("data-fileid"));
               
            },
            error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
               
               $(document).ready(function() {
                  
                     if (confirm("code:" + request.status + "\n" + "message:"
                           + request.responseText + "\n" + "error:" + error)) {
                        console.log("code:" + request.status + "\n" + "message:"
                              + request.responseText + "\n" + "error:" + error);
                        console.log("/destiny/upload/list/" + $(this).attr("data-fileid"));
                        return true;
                     } else {
                        return false;
                     }               
               });
            }
            
         });      
      
      })
   })
   
   
   $(function() {
      $("[id=popbutton2]").click(function() {
         //jquery로 현재 객체의 data-fileid 속성을 읽어서 변수에 저장하고 그변수를..
         console.log('/destiny/analytics/info/' + $(this).attr("data-fileid"));
         $.ajax({
            type : "GET", // GET 또는 POST
            url : '/destiny/analytics/summary/' + $(this).attr("data-fileid"), // 서버측에서 가져올 페이지
//            data: '3',
            timeout : 5000, // 응답대기시간 
            dataType : 'jsp', // html , javascript, text, xml, jsonp 등이 있다
            beforeSend : function() { // ajax 요청하기전에 실행되는 함수??
            },
            success : function(data) { // 정상적으로 완료되었을 경우에 실행된다
               $('div.modal').modal({
                  remote : 'data'
               });
               console.log(data); // data 인수에는 return 되어진 data 가 저장되어 있다
               $("#my-dialog,#dialog-background").show();         
               
               
            },
            error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
               console.log("code:" + request.status + "\n" + "message:"
                     + request.responseText + "\n" + "error:" + error);
            },
            complete : function() { // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
            }
         });         
      
      })
   })
</script>
<style type="text/css">
.button{
   padding:5px;
   margin:6%;
   border-radius:5px;
   background:#3399cc;
   color:#fff;
   font-size:5;
   border:none;
   cursor:pointer;
}
.modal{
   width:100%;
   height:100%;
   POSITION:fixed;
   top:0;
   }
.modal_bg{
   background :rgba(0,0,0,.7);
   height:100%;
   width:100%;
   position:fixed;
   top:0;
}
.modal_main{
   position:fixed;
   width:50%;
   height:400px;
   background:#fff;
   border-radius:6px;
   top:9%;
   left:24%;
   z-index:1;
   -webkit-animation-duration:.5%;
   -webkit-animation-delay: .0%;
   -webkit-animation-fill-mode:both;
   -moz-animation-fill-mode:both;
   -o-animation-fill-mode: both;
   -webkit-backface-visibility:visible!important;
   -webkit-animation-name:fadeInRight;
   
}
@-webkit-keyframes fadeInRight{
   0%{ opacity:0;-webkit-transform:translateX(20px)}
   100%{opacity:1;-webkit-transform:translateX(0)}
}
.close{
   position:absolute;
   top:3%;
   right:2.4%;
   cursor:pointer;
}
.dibugConsole{
   width: 500px;
    padding: 50px;
    border: 5px solid gray;
    margin: 0;
   
}
#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 160px ); top: calc( 50% - 70px );
    width: 320px; height: 140px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}
</style>

<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
   <c:url var="actionURL" value='/upload/new' />
   <form action="${actionURL}" method="post" enctype="multipart/form-data"
      class="form-horizontal">

      <div id="myForm">
         <h3>File Upload</h3>
         <input type="file" name="file" id="txtFileUpload" accept=".csv">
         <button  type="submit" onclick="myFunction()"> 저장</button>
         <input type="reset"   id="reset" value="취소">
      </div>

      <h3>File List</h3>
      <table border="1">
         <tr>
            <th>ID</th>
            <td>경로</td>
            <td>파일명</td>
            <td>크기</td>
            <td>유형</td>
            <td>날짜</td>
            <td>상세설명</td>
            <td>삭제</td>
         </tr>
         <c:forEach var="file" items="${fileList}">
            <tr>
               <td><input type="checkbox" name="fileId" id="${file.fileName}"
                  value="${file.fileId}">${file.fileId}</td>
               <td>${file.directoryName}</td>
               <td><c:set var="len" value="${fn:length(file.fileName)}" /> <c:set
                     var="filetype"
                     value="${fn:toUpperCase(fn:substring(file.fileName, len-4, len))}" />
                  <c:if
                     test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
                     <img src='<c:url value="/img/${file.fileId}"/>' width="100"
                        class="img-thumbnail">
                     <br>
                  </c:if> <c:if
                     test="${!((filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF'))}">
                     <a href='<c:url value="/pds/${file.fileId}"/>'>${file.fileName}</a>
                     <br>
                  </c:if>
               </td>
               <td><fmt:formatNumber value="${file.fileSize/1024}"
                     pattern="#,###" />KB</td>
               <td>${file.fileContentType}</td>
               <td>${file.fileUploadDate}</td>
               <td>
                            <!-- Modal -->
            
                  <input type="button" class="button" id="popbutton1" name ="popbutton1" data-fileid="${file.fileId}" value="내용보기"
                  data-target="#myModal"/>
            
                  <input type="button" class="button" id="popbutton2" name ="popbutton2" data-fileid="${file.fileId}" value="요약"/>
                  
                  
                  
                  <div class = "modal">
               
                      <div class="modal_bg"></div>
                      <div class="modal_main">
                         <h3 style="margin:3%;font-family:Arial;">Hello</h3>
                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                          </button>   
                      </div>      
      
                      <a data-toggle="modal" href="#myModal">Open Modal</a>
                  
                     <!-- Other elements -->
                     <p data-toggle="modal" data-target="#myModal"></p>
                  </div>   
                  </td>            
                  
               <td><a href='<c:url value="/upload/delete/${file.fileId}"/>'
                  class="delete">삭제</a></td>
            </tr>
         </c:forEach>
      </table>
      <h3></h3>
      <input type="button" onclick="checkSelectedValue();" value="선택영역 확인"/>
      
         <h3>확인</h3>
         
         <div class="dibugConsole" id="dibugConsole"></div>
         <h3></h3>
         <input type="button" onclick="checkSelectedId();" value="다음"/>

   </form>
</div> <!-- End Container -->   
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>