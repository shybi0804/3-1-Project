<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" %>
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/gallery/gallery.css">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
<script>
function fn_galleryRead(board_no){
	location.href="/gallery_read.do?bno=" + board_no;
}

$(function(){
	$("#gallery").dataTable(
	{
		"paging" : true,
		"ordering" : false,
		"info" : false,
		"lengthChange" : false
	}		
	);
});

</script>
<body>

<!--Start Container-->
	<div id="main" class="container-fluid">
	<div class="row">
		<!--Start Content-->

			<div id="ajax-content">
				<div class="parallax-content baner-content" id="home">
					<div class="container">
						<div class="row">
							
							
							
							<h1>Gallery</h1>
							<h4>- Our Activities. -</h4>
							
							<div id="gallery_wrap">
							
							<c:choose>
								<c:when test="${not empty sessionScope.userLoginInfo }">
									<div id="menu_wrap">
										<a href="/gallery_write.do">갤러리 게시물 쓰기</a>
									</div>
								</c:when>
							</c:choose>
								
								
								<div>
								<table id="gallery">
								<thead>
								<tr><th>이미지</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성날짜</th>
								</tr>
								</thead>
								<tbody>
									<c:choose>
									<c:when test="${fn:length(galleryList)-1 >= 0}">
									<c:forEach var="galleryOne" items="${galleryList}" varStatus="status">
								<tr height="100">
								
										<td width="20%" height="15">
											<div onclick="fn_galleryRead('${galleryOne.galleryInfo.board_no}')">
													<div><img src="data:image/png;base64,${galleryOne.mainImg}" class="img" 
														alt="이미지 업로드를 다시 확인하세요.,${galleryOne.mainImg}"/></div>
													
												</div>
									    </td>
										<td><p>${galleryOne.galleryInfo.gallery_title }</p></td>
										
										<td><p>${galleryOne.galleryInfo.gallery_writer }</p></td>
										<td><p>${galleryOne.galleryInfo.gallery_redate }</p></td>
								
								</tr>
								</c:forEach>
								</c:when>
								<c:otherwise>
											아직 업로드 된 사진이 없습니다.
										</c:otherwise>
										</c:choose>
								</tbody>
								</table>
									
										
											
												
											
										
										
									
								</div>
							</div>
							
</div></div></div></div></div></div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />