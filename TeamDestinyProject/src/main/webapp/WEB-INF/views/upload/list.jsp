<%@ page contentType="text/html; charset=UTF-8"
   trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Destiny</title>
<!-- Favicon -->
<link href="<c:url value='/favicon.png'/>" rel="icon" type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='//code.jquery.com/jquery.min.js'></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript">


   $(document)
         .ready(
               function() {

                  // The event listener for the file upload
                  document.getElementById('txtFileUpload')
                        .addEventListener('change', upload, false);

                  // Method that checks that the browser supports the HTML5 File API
                  function browserSupportFileUpload() {
                     var isCompatible = false;
                     if (window.File && window.FileReader
                           && window.FileList && window.Blob) {
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
                              alert('Imported -' + data.length
                                    + '- rows successfully!');
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
      if (fileExt == ".csv") {
         confirm("저장되었습니다.");
      } else
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

   function checkSelectedValue() {
      var valueArr = new Array();
      var list = $("input[name='fileId']");
      for (var i = 0; i < list.length; i++) {
         if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].id);
         }
      }

      //선택된 체크박스의 값을 콘솔에 출력
      var str = '';
      for ( var i in valueArr) {
         str += valueArr[i] + '&nbsp;&nbsp;&nbsp;&nbsp;';
      }
      $('#dibugConsole').html(str);
      console.log(str);
   }
   function checkSelectedId() {

      var str2 = '';
      var valueArr = new Array();

      var list = $("input[name='fileId']");
      for (var i = 0; i < list.length; i++) {
         if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
         }
      }

      //선택된 체크박스의 값을 콘솔에 출력
      for ( var i in valueArr) {
         if (i < valueArr.length - 1) {
            str2 += valueArr[i] + "/";
         } else
            str2 += valueArr[i];
      }

      location.href = 'http://localhost:8080/destiny/analytics/info/'
            + valueArr;
   }

   //--------------------------------------------------

   $(document).ready(function() {
      var modalLayer = $("#modalLayer");
      var modalLink = $(".modalLink");
      var modalCont = $(".modalContent");
      var marginLeft = modalCont.outerWidth() / 2;
      var marginTop = modalCont.outerHeight() / 2;

      modalLink.click(function() {
         modalLayer.fadeIn("slow");
         modalCont.css({
            "margin-top" : -marginTop,
            "margin-left" : -marginLeft
         });
         $(this).blur();
         $(".modalContent > a").focus();
         return false;
      });

      $(".modalContent > button").click(function() {
         modalLayer.fadeOut("slow");
         modalLink.focus();
      });
      //location.href = "/destiny/upload/select";
      
       $("#select").click(function() {
         var index = $('input:radio[name=radioo]:checked').val();

         var request = {
            dd : index
         };
         $.ajax({
            url : '/destiny/upload/select',
            headers : {
               'Accept' : 'application/json',
               'Content-Type' : 'application/json'
            },
            dataType : 'text',
            data : JSON.stringify(request),
            type : 'post',
            success : function(data) {
               //alert("성공:" + data.KEY);
               $("#test").html(data).show();
               //jsp 파일로 저장을하고 
            }
         
         })
      }) 
   });
</script>

<style type="text/css">

html, body{
position:static;
margin:0;
padding:0;
height:100%;
}

footer{
    position:relative;
    bottom:0;
    top: 45px;
    width:100%;
}

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nt100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 100;
}
.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 300;
}
<!-- 레귤러 폰트 -->
.nt400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 400;
}
.nt500 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 500;
}
.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 700;
}
.nt900 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 900;
}

a {
   color: #000;
}

.mask {
   width: 100%;
   height: 100%;
   position: fixed;
   left: 0;
   top: 0;
   z-index: 10;
   background: #000;
   opacity: .5;
   filter: alpha(opacity = 50);
}
#test {
   display: none;
}

.blank{
margin-top:5px;
margin-bottom:5px;n
}

.blank1{
margin-top:10px;
margin-bottom:10px;
}


</style>
<body>
   <jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container" style="font-family:'Noto Sans KR', sans-serif; font-weight:400; color: #1e1e1e;">
   <c:url var="actionURL" value='/upload/new' />
   <form action="${actionURL}" method="post" enctype="multipart/form-data"
      class="form-horizontal">

      <div id="myForm">
         <div style="border-bottom: 1px solid #1e1e1e; width:80%">
         <h3>File Upload</h3>
         </div>
         <div class="blank">&nbsp;</div>
         <input type="file" name="file" id="txtFileUpload" accept=".csv">
         <div class="blank">&nbsp;</div>
         <button type="submit" onclick="myFunction()"  style="margin-right:10px;">저장</button>
         <input type="reset" id="reset" value="취소">
      </div>

<div class="blank1">&nbsp;</div>

	<div style="border-bottom: 1px solid #1e1e1e; width:80%">
      <h3>File List</h3>
      </div>
      <div class="blank">&nbsp;</div>
      <table border="1">
         <tr>
            <th style="padding: 10px;">ID</th>
            <td style="padding: 10px;">경로</td>
            <td style="padding: 10px;">파일명</td>
            <td style="padding: 10px;">크기</td>
            <td style="padding: 10px;">유형</td>
            <td style="padding: 10px;">날짜</td>
            <td style="padding: 10px;">상세설명</td>
            <td style="padding: 10px;">삭제</td>
            <td style="display: none; padding: 10px;">순서</td>
            <td style="display: none; padding: 10px;">사용자 id</td>
         </tr>
         <c:forEach var="file" items="${fileList}">
            <tr>
               <td style="padding: 10px;"><input type="checkbox" name="fileId" id="${file.fileName}"
                  value="${file.fileId}">${file.fileId}</td>
               <td style="padding: 10px;">${file.directoryName}</td>
               <td style="padding: 10px;"><c:set var="len" value="${fn:length(file.fileName)}" /> <c:set
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
                  </c:if></td>
               <td style="padding: 10px;"><fmt:formatNumber value="${file.fileSize/1024}"
                     pattern="#,###" />KB</td>
               <td style="padding: 10px;">${file.fileContentType}</td>
               <td style="padding: 10px;">${file.fileUploadDate}</td>
               <td style="display: none; padding: 10px;">${file.flowNum}</td>
               <td>
                  <!-- Modal --> <input type="radio" name="radioo"
                  value="${file.fileId}"> 
               </td>

               <td><a href='<c:url value="/upload/delete/${file.fileId}"/>'
                  class="delete">삭제</a></td>
            </tr>
         </c:forEach>
      </table>
      <h3></h3>
      <input type="button" onclick="checkSelectedValue();" value="선택영역 확인" />

      <!-- Modal -->
      <input type="button" id="select" class="btn btn-info btn-lg" data-toggle="modal"  data-target="#myModal"
       value="요약">
      <div id="test"></div>

	
      <h3>확인</h3>

      <div class="dibugConsole" id="dibugConsole" style="border: 1px solid #1e1e1e; border-radius: 3px; position:relative; height: 32px; padding:5px 0px 0px 5px; width:60%;"></div>
      <div class="blank">&nbsp;</div>
      <input type="button" id="GetTotal" onclick="checkSelectedId();"
         value="다음"/>

   </form>
</div>
</body>
<footer><jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include></footer>
</html>