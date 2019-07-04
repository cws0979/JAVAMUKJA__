<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html style="height: 688px; ">
<head>
<style>
.table-bordered th, .table-bordered td {
    border: 1px solid #121618;

 table { 
 	border-collapse: ; 
 }


</style>
<title style="color:#fac564;">Member List</title>
<meta charset="utf-8">
<script type="text/javascript">
function read(id){
  var url = "${root}/member/read";
  url += "?id="+id;
  
  location.href=url;
}
</script>
</head>
<body>
  <div class="container col-sm-5">
  <br>
    <h1 class="col-sm-offset-2 col-sm-6" style="color:#fac564;">Member List</h1>
    <br><br>
    <form class="form-inline" method="post" action="list">
    <div class="form-group">
    <select class="form-control" name="col">
    <option value="mname" style="color: black"
    <c:if test="${col=='mname' }">selected</c:if>
    >이름</option>
    <option value="id" style="color: black"
    <c:if test="${col=='id' }">selected</c:if>
    >아이디</option>
    <option value="total" style="color: black"
    <c:if test="${col=='total' }">selected</c:if>
    >전체출력</option>
    </select>
    </div>
    <div class="form-group">
    <input type="text" class="form-control" placeholder="Enter 검색어"
    name="word" value="${word}">
    </div>
    <button class="btn btn-primary p-2 px-xl-3 py-xl-2" style="margin-right:5px;"
    >검색</button>
    <button type="button" class="btn btn-primary p-2 px-xl-3 py-xl-2"
    onclick="location.href='${root}/member/agreement'">등록</button>
    </form>
    <c:forEach var="dto" items="${list}">
    <br>
    <table class="table table-bordered" style="border:1px solid #fac564">    
        <tr>
          <td rowspan="5">
          <img src="${root}/member/storage/${dto.fname}"
          class="img-rounded" width="260px" height="240px">
          </td>
          <th>ID</th>
          <td><a href="javascript:read('${dto.id}')">${dto.id}</a></td>
        </tr>
      <tr>
      <th>NAME</th>
      <td>${dto.mname}</td>
      </tr>
      <tr>
      <th>NICKNAME</th>
      <td>${dto.nickname}</td>
      </tr>
      <tr>
      <th>E-MAIL</th>
      <td>${dto.email}</td>
      </tr>
      <tr>
      <th>ADDRESS</th>
      <td>(${dto.zipcode})${dto.address}</td>
      </tr>
    </table>
    </c:forEach>
    ${paging}
  </div>
</body>
</html>
