<%@ page contentType="text/html; charset=utf-8"
   trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content" style="overflow-x: auto;">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">열 단위 출력</h4>
         </div>
         <div class="modal-body">
            <table border="1">
               <tr>
                  <c:forEach var="colName" items="${result.colNames}">
                     <th>${colName}</th>
                  </c:forEach>
               </tr>
               <tr>
                  <c:forEach var="i" begin="0" end="${fn:length(result.colNames)-1}">
                     <!-- i는 열 하나하나 -->
                     <td><c:forEach var="j" begin="0" end="${result.nrow-2}">
                           <!-- j는 summary의 행 하나하나 -->
                     ${result.summary[(result.nrow*i)+j]}<br>
                           <!-- rSummary 모델의 summary, nrow로 몇 행 몇 열을 표현한다. -->
                        </c:forEach></td>
                  </c:forEach>
               </tr>
            </table>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>

   </div>
</div>


