<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<c:choose>
<c:when test="${flag}">
${param.email} 은(는) 중복되어 사용할 수 없습니다.
</c:when>
<c:otherwise>
${param.email} 은(는) 중복이 아니므로 사용가능합니다.
</c:otherwise>
</c:choose>
