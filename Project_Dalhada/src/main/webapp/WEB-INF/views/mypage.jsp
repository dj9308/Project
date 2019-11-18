<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
   import="vo.MemberinfoVO, java.util.ArrayList,java.util.Map,java.util.HashMap,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Dalhada - mypage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/peak.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
      integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
      crossorigin=""/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<!--===============================================================================================-->

</head>
<body class="animsition">
<!-- Header -->
   <header class="header-v2">
      <!-- Header desktop -->
      <div class="container-menu-desktop trans-03">
         <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop p-l-45">
               
               <!-- Logo desktop -->      
               <a href="main" class="logo">
                  <img src="images/icons/logo-01.png" alt="IMG-LOGO">
               </a>
               <!-- Icon header -->
               <div class="wrap-icon-header flex-w flex-r-m h-full">
                  <form id="searchForm" class="form-inline flex-c-m h-full p-r-24" action="searchbucket" method="get">
                      <div class="bor17 of-hidden pos-relative">
                        <input class="searchKeyDown stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" 
                        name="searchKeyword" placeholder="Search" value="${ keyword }" autocomplete="off">
                        <button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
                           <i class="zmdi zmdi-search"></i>
                        </button>
                     </div>
                    </form>
                     <div class="flex-c-m h-full p-r-24">
                        <p class="js-show-modal-create hov-cl1">버킷 +</p>
                     </div>
                     <div class="flex-c-m h-full p-r-24">
                        <a href="mypage">마이페이지</a>
                     </div>
                     <div class="flex-c-m h-full p-r-24">
                        <a href="logout">로그아웃</a>
                     </div>
               </div>
            </nav>
         </div>   
      </div>
      <!-- Header desktop End -->

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
         <!-- Logo moblie -->      
         <div class="logo-mobile">
            <a href="main"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
         </div>

         <!-- Button show menu -->
         <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
            <span class="hamburger-box">
               <span class="hamburger-inner"></span>
            </span>
         </div>
      </div>
      <!-- Header Mobile End -->

      <!-- Menu Mobile -->
      <div class="menu-mobile">
         <ul class="main-menu-m">
            <li>
               <form id="searchForm" class="form-inline" action="searchbucket" method="get">
                      <div class="bor17 of-hidden pos-relative">
                        <input class="searchKeyDown stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" 
                        name="searchKeyword" placeholder="Search" value="${ keyword }" autocomplete="off">
                        <button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
                           <i class="zmdi zmdi-search"></i>
                        </button>
                     </div>
                 </form>
            </li>
               <li>
                  <a class="js-show-modal-create hov-cl1">버킷+</a>
               </li>
               <li>
                  <a href="memberform">마이페이지</a>
               </li>
               <li>
                  <a href="loginmain">로그아웃</a>
               </li>
         </ul>
      </div>
      <!-- Menu Mobile End -->
   
   </header>
   <!-- Header End -->


   <c:if test='${!empty info}'>

      <div class="container">
         <nav id="area1">
            <fieldset id="area11">
               <legend>내 정보</legend>
               <table id="table1">
                  <tr>
                     <td><c:if test="${!empty info.image_path}">
                           <c:if test="${fn:contains(info.image_path,'https://')}">
                              <img class='photo3' src="${info.image_path}" />
                           </c:if>
                           <c:if test="${!fn:contains(info.image_path,'https://')}">
                              <img class='photo3'
                                 src="images/profile/${info.image_path}" />
                           </c:if>
                        </c:if> <c:if test="${empty info.image_path}">
                           <img class='photo3'
                              src="images/profile.png" />
                        </c:if></td>
                  </tr>
                  <tr>
                     <td>${info.id}</td>
                  </tr>
                  <tr>
                     <td><c:if test="${empty info.my_words}">코멘트를 남겨주세요!</c:if> <c:if
                           test="${!empty info.my_words}">${info.my_words}</c:if><br>
                     </td>
                  </tr>
                  <tr>
                     <td><button type="button" onclick="modalOpen2();">회원정보  수정</button></td>
                  </tr>
                  <tr>
                     <td>
                        <button type="button" onclick="achieve();">아카이브 페이지</button>
                     </td>
                  </tr>
               </table>
            </fieldset>
            <c:if test="${!empty info.password}">
               <div id="id02" class="modal">
                  <div class="modal-content animate">

                     <input type="hidden" name="action" value="update">
                     <div class="imgcontainer">
                        <span onclick="modalCancel();" class="close" title="Close Modal">×</span>
                     </div>

                     <div class="container2">
                        <div class="main">
                           <div class="panel-heading">
                              <div class="panel-title text-center">
                                 <h1 class="title">회원정보 수정</h1>
                              </div>
                           </div>
                           <div id="CkUpdate" class="main-login main-center">
                              <div class="form-group">
                                 <label for="password" class="cols-sm-2 control-label">Password</label>
                                 <div class="cols-sm-10">
                                    <div class="input-group">
                                       <span class="input-group-addon">
                                          <i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                                       </span> 
                                       <input type="password" id="upPw" class="form-control-mypage" required
                                          placeholder="Enter your Password" />
                                    </div>
                                 </div>
                              </div>
                              <div id="pwError"></div>
                              <div class="form-group">
                                 <button onclick="ConfirmPw();" id="submit" type="button"
                                    class="btn btn-primary btn-lg btn-block login-button">확인</button>
                              </div>
                           </div>
                           <!-- 비밀번호 확인후 출력 -->
                           <div id="updateInfo" style="display: none;"
                              class="main-login main-center">
                              <form action="/dalhada/mypage" method="post"
                                 enctype="multipart/form-data">
                                 <input type="hidden" name="action" value="UpInfo">
                                 <div class="avatar-upload">
                                    <div class="avatar-edit">
                                       <input type='file' id="imageUpload" name="image"
                                          accept=".png, .jpg, .jpeg" /> <label for="imageUpload"></label>
                                    </div>
                                    <div class="avatar-preview">
                                       <c:if test="${!empty info.image_path}">
                                          <div id="imagePreview"
                                             style="background-image: url('resources/images/profile/${info.image_path}');">
                                          </div>
                                       </c:if>
                                       <c:if test="${empty info.image_path}">
                                          <div id="imagePreview"
                                             style="background-image: url('resources/images/profile.png');">
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <span class="input-group-addon"><i
                                             class="fa fa-envelope fa" aria-hidden="true"></i></span> 
                                          <input type="text" class="form-control-mypage" value="${info.email}"
                                             name="email" required placeholder="Enter your Email" />
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="birth" class="cols-sm-2 control-label">Your Birth</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <span class="input-group-addon"><i
                                             class="fa fa-user fa" aria-hidden="true"></i></span> 
                                       	  <input type="date" class="form-control-mypage" name="birth"
                                             value="${info.birth}" required />
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="confirm" class="cols-sm-2 control-label">your comment</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <textarea style="margin: 8px;" rows="7" cols="30"
                                             name="my_words" placeholder="코멘트를 남겨주세요!">${info.my_words}</textarea>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group ">
                                    <input id="submit" type="submit"
                                       class="btn btn-primary btn-lg btn-block login-button">
                                 </div>
                                 <hr>
                              </form>
                              <form action="/dalhada/mypage" method="post">
                                 <input type="hidden" name="action" value="UpCheck">
                                 <div class="form-group">
                                    <h3>비밀번호 수정</h3>
                                    <label for="password" class="cols-sm-2 control-label">Password</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <span class="input-group-addon">
                                             <i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                                          </span> 
                                          <input type="password" id="pw" class="form-control-mypage"
                                             name="password" required placeholder="Enter your Password" />
                                       </div>
                                    </div>
                                 </div>

                                 <div class="form-group">
                                    <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <span class="input-group-addon">
                                             <i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                                          </span> 
                                          <input type="password" id="pwcheck" class="form-control-mypage"
                                             name="pwcheck" onkeyup="checkPwd()" required
                                             placeholder="Confirm your Password" />
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group ">
                                    <input id="submit" type="submit" class="btn btn-primary btn-lg btn-block login-button">
                                 </div>
                              </form>
                              <div id="checkPwd"></div>
                           </div>
                        </div>
                        <button type="button" onclick="modalCancel();" class="cancelbtn">Cancel</button>
                     </div>
                  </div>
               </div>
            </c:if>
            <c:if test="${empty info.password}">

               <div id="id02" class="modal">
                  <div class="modal-content animate">

                     <input type="hidden" name="action" value="update">
                     <div class="imgcontainer">
                        <span onclick="modalCancel();" class="close" title="Close Modal">×</span>
                     </div>

                     <div class="container2">
                        <div class="main">
                           <div class="panel-heading">
                              <div class="panel-title text-center">
                                 <h1 class="title">회원정보 수정</h1>
                                 <hr/>
                              </div>
                           </div>
                           <!-- 비밀번호 확인후 출력 -->
                           <div id="updateInfo" class="main-login main-center">
                              <form action="/dalhada/mypage" method="post"
                                 enctype="multipart/form-data">
                                 <input type="hidden" name="action" value="UpInfo">
                                 <div class="avatar-upload">
                                    <div class="avatar-edit">
                                       <input type='file' id="imageUpload" name="image" accept=".png, .jpg, .jpeg"/> 
                                       <label for="imageUpload"></label>
                                    </div>
                                    <div class="avatar-preview">
                                       <c:if test="${!empty info.image_path}">
                                          <c:if test="${fn:contains(info.image_path,'https://')}">
                                             <div id="imagePreview" style="background-image: url('${info.image_path}');"></div>
                                          </c:if>
                                          <c:if test="${!fn:contains(info.image_path,'https://')}">
                                             <div id="imagePreview"
                                                style="background-image: url('resources/images/profile/${info.image_path}');">
                                             </div>
                                          </c:if>
                                       </c:if>
                                       <c:if test="${empty info.image_path}">
                                          <div id="imagePreview"
                                             style="background-image: url('resources/images/profile.png');">
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <span class="input-group-addon"><i
                                             class="fa fa-envelope fa" aria-hidden="true"></i>
                                          </span> 
                                          <input type="text" class="form-control-mypage" value="${info.email}"
                                             name="email" required placeholder="Enter your Email" />
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="birth" class="cols-sm-2 control-label">Your Birth</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <span class="input-group-addon">
                                             <i class="fa fa-user fa" aria-hidden="true"></i>
                                          </span> 
                                          <input type="date" class="form-control-mypage" name="birth"
                                             value="${info.birth}" required />
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label for="confirm" class="cols-sm-2 control-label">your comment</label>
                                    <div class="cols-sm-10">
                                       <div class="input-group">
                                          <textarea style="margin: 8px;" rows="10" cols="30"
                                             name="my_words" placeholder="코멘트를 남겨주세요!">${info.my_words}</textarea>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group ">
                                    <input id="submit" type="submit" class="btn btn-primary btn-lg btn-block login-button">
                                 </div>
                                 <hr>
                              </form>
                           </div>
                        </div>
                        <button type="button" onclick="modalCancel();" class="cancelbtn">Cancel</button>
                     </div>
                  </div>
               </div>
            </c:if>
         </nav>
         <!-- 버킷 리스트 START -->
         <section id="area2">
            <fieldset id="area22">
               <legend>마이 버킷</legend>
               <table id="table2">
                  <tr>
                     <td>
                     <c:if test="${!empty perc}">
                        <div class="progress1">
                           <div class="progress progress-striped">
                              <div class="progress-bar progress-bar-danger"
                                 role="progressbar" aria-valuenow="80" aria-valuemin="0"
                                 aria-valuemax="100" style="width: ${perc}%">
                              <span>${perc}%</span>
                              </div>
                           </div>
                        </div>
                     </c:if>
                     </td>
                  </tr>

                  <tr>
                     <td>
                        <div class="dropdown">
                           <select id="selectBox" onchange="changeFunc();"
                              class="dropdown-select">
                              <option>------------</option>
                              <option value="all">전체</option>

                              <c:forEach var="vo" items="${group}">
                                 <option value="${vo.id}">${vo.name}</option>
                              </c:forEach>
                           </select>
                        </div>
                        <button onclick="modalOpen();" style="width: auto;">그룹 관리</button>
                        <br><br>

                        <div id="id01" class="modal">
                           <form class="modal-content animate" action="/dalhada/mypage"
                              method="post">
                              <div class="imgcontainer">
                                 <span onclick="modalCancel();" class="close" title="Close Modal">×</span>
                              </div>

                              <div class="container1">
                                 <h3>그룹 관리</h3>

                                 <c:forEach var="vo" items="${group}">
                                    <div style="margin: 0px;">
                                       <input type="text" class="groupModal" name="Group1" value="${vo.name}"> 
                                       <input type="hidden" name="Groupnum" value="${vo.id}"> 
                                       <input type="hidden" name="oriGroup" value="${vo.name}">
                                       <button type="button" class="delGroup" value="${vo.id}">삭제</button>
                                    </div>
                                 </c:forEach>
                                 <div style="margin: 0px;" id="plusGroup"></div>
                                 <img style="widows: 20px; height: 20px;" onclick="plusGroup();"
                                    src="images/plus.png"><br>
                                 <button type="submit">확인</button>
                                 <button type="button" onclick="modalCancel();" class="cancelbtn">Cancel</button>
                              </div>
                           </form>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <button id="listAll">전체</button>
                        <button id="listProg">도전중</button>
                        <button id="listDone">완료</button>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <table id="tableMenu">
                           <tr>
                              <th>삭제</th>
                              <th id="BuckTitle">제목</th>
                              <th>기한</th>
                              <th>수정</th>
                              <th style="display: none;" id="confirm">완료하기</th>
                           </tr>
                        </table>
                        <form action="/dalhada/mypage" method="post">
                           <div id="wrapper">
                              <div class="scrollbar_mypage" id="style-5">
                                 <div class="force-overflow">

                                    <table id="bucketTable">
                                       <tr>
                                       <tbody class="All">
                                          <c:if test="${!empty listAll}">
                                             <c:forEach var="vo1" items="${listAll}">
                                                <tr>
                                                   <td><input  style="margin-left:auto; margin-right:auto;" type="checkbox" name="box" value="${vo1.id}"></td>
                                                   <td class="js-show-modal-bucket BuckTitle" data-id="${vo1.id}">${vo1.title}</td>
                                                   <td style="width: 111px;">${vo1.d_day}</td>
                                                   <td style="width: 111px;"><button type="button" data-id="${vo1.id}"
                                                         class="js-show-modal-edit">수정</button></td>
                                                </tr>
                                             </c:forEach>
                                          </c:if>
                                       </tbody>
                                       <tbody class="Prog" style="display: none">
                                          <c:if test="${!empty listProg}">
                                             <c:forEach var="vo1" items="${listProg}">
                                                <tr>
                                                   <td style="width:66px;"><input style="margin-left:auto; margin-right:auto;" type="checkbox" name="box" value="${vo1.id}"></td>
                                                   <td style="width:333px;" data-id="${vo1.id}" class="js-show-modal-bucket">${vo1.title}</td>
                                                   <td style="width: 60px;">${vo1.d_day}</td>
                                                   <td><button class="js-show-modal-edit" data-id="${vo1.id}">수정</button></td>
                                                   <td><button class="comp" value="${vo1.id}">완료하기</button></td>
                                                </tr>
                                             </c:forEach>
                                          </c:if>
                                       </tbody>

                                       <tbody class="Done" style="display: none">
                                          <c:if test="${!empty listDone}">
                                             <c:forEach var="vo1" items="${listDone}">
                                                <tr>
                                                   <td style="width: 111px;"><input style="margin-left:auto; margin-right:auto;" type="checkbox" name="box" value="${vo1.id}"></td>
                                                   <td style="width: 333px;" class="js-show-modal-bucket BuckTitle" data-id="${vo1.id}">${vo1.title}</td>
                                                   <td style="width: 111px;">${vo1.d_day}</td>
                                                   <td style="width: 111px;"><button class="js-show-modal-edit" data-id="${vo1.id}">수정</button></td>
                                                </tr>
                                             </c:forEach>
                                          </c:if>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                           <br>
                           <div id="bucketdel">
                              <button type="submit">삭제하기</button>
                           </div>
                        </form>
                     </td>
                  </tr>

               </table>
            </fieldset>
         </section>
         <!-- 버킷 리스트 END-->
      </div>
   </c:if>
   <%@ include file="modal_detail.jsp" %>
   <%@ include file="modal_create.jsp" %>
   <%@ include file="modal_edit.jsp" %>
   <!--===============================================================================================-->
   <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
   <!--===============================================================================================-->
   <script src="vendor/animsition/js/animsition.min.js"></script>
   <!--===============================================================================================-->
   <script src="vendor/bootstrap/js/popper.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
   <!--===============================================================================================-->
   <script src="vendor/daterangepicker/moment.min.js"></script>
   <!--===============================================================================================-->
   <script src="vendor/slick/slick.min.js"></script>
   <script src="js/slick-custom.js"></script>
   <!--===============================================================================================-->
   <script src="vendor/isotope/isotope.pkgd.min.js"></script>
   <!--=================================================================================-->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.10/js/perfect-scrollbar.jquery.js"></script>
   <!--===============================================================================================-->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
   <!--===============================================================================================-->
   <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
      integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
      crossorigin=""></script>
   <!--===============================================================================================-->
   <script src="js/main.js"></script>
   <script src="js/mypage.js"></script>

</body>
</html>