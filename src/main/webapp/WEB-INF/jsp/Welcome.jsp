<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<style>
ul {
	list-style: none;
	padding: 0; 
	margin: 0;
}

.menu {
	display: flex;
	justify-content: space-around;
}

li {
	hover: none;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 50%;
	margin: 0 auto;
}
</style>
<meta charset="ISO-8859-1">
<title> ONLINE SHOPPING </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/demo.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/HomePage.css" />"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="w3-top">
		<nav>
			<ul class="w3-navbar w3-black w3-card-2 w3-medium  "
				style="opacity: 0.9">
				<li><a href="Welcomepage"
					class="w3-hover-none w3-text-sand w3-hover-text-white"><i
						class="fa fa-home"></i> S H O P P I E E </a></li>
				<c:choose>
					<c:when test="${LoggedIn}">

						<li style="float: right"><a href="perform_logout"
							class="w3-hover-none w3-text-sand w3-hover-text-white"><i
								class="fa fa-sign-out"></i></a></li>
						<c:choose>
							<c:when test="${!Administrator}">
								<li style="float: right"><a href="viewcart"
									class="w3-hover-none w3-text-sand w3-hover-text-white"><i
										class="fa fa-shopping-cart"></i> <span
										class="w3-badge w3-white">${cartsize}</span></a></li>
							</c:when>
						</c:choose>

						<li style="float: right"><a href="#"
							class="w3-hover-none w3-text-sand w3-hover-text-white"><i
								class="fa fa-user"></i> Hi, ${name}</a></li>
					</c:when>

					<c:otherwise>
						<li style="float: right"><a href="Register"
							class="w3-hover-none w3-text-sand w3-hover-text-white"><i
								class="fa fa-user-plus"></i></a></li>
						<li style="float: right"><a href="login"
							class="w3-hover-none w3-text-sand w3-hover-text-white"><i
								class="fa fa-sign-in"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>

			<c:choose>
				<c:when test="${!Administrator}">
					<!-- Category List -->
					<c:if test="${!empty categoryList}">
						<div>
							<ul
								class="w3-navbar w3-light-pink w3-round w3-small menu w3-card-4 "
								Style="width: 70%; margin-left: 15%; margin-top: -2px;">
								<c:forEach items="${categoryList}" var="category">
									<li><a href="view/${category.id}" class="w3-hover-none"><i
											class="fa fa-list-alt" aria-hidden="true"></i>
											${category.name}</a></li>
								</c:forEach>

							</ul>
						</div>
					</c:if>
				</c:when>

				<c:when test="${Administrator}">
					<ul
						class="w3-navbar w3-light-grey w3-round w3-small menu w3-card-4 "
						Style="width: 70%; margin-left: 15%; margin-top: -2px;">
						<!-- 		<li><a href="Report" class="w3-hover-none"><i
								class="fa fa-cog fa-spin  fa-fw"></i> <span class="sr-only">Loading...</span>
								Recent Order</a></li> -->
						<li><a href="product" class="w3-hover-none"><i
								class="fa fa-refresh fa-spin  fa-fw"></i> <span class="sr-only">Loading...</span>
								Products</a></li>
						<li><a href="category" class="w3-hover-none"><i
								class="fa fa-refresh fa-spin  fa-fw"></i> <span class="sr-only">Loading...</span>
								Category</a></li>
						<li><a href="supplier" class="w3-hover-none"><i
								class="fa fa-refresh fa-spin  fa-fw"></i> <span class="sr-only">Loading...</span>
								Supplier</a></li>
					</ul>
				</c:when>
			</c:choose>
		</nav>
	</div>



	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/jsp/cart.jsp">
			</c:import>
		</c:when>
		<c:when test="${IndividualItemClicked}">
			<c:import url="/WEB-INF/jsp/IndividualItem.jsp">
			</c:import>
		</c:when>
		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/jsp/Payment.jsp">
			</c:import>
		</c:when>
	</c:choose>
	<!-- Category List End -->
	<c:choose>
		<c:when test="${IfLoginClicked}">
			<c:import url="/WEB-INF/jsp/logins.jsp">
			</c:import>
		</c:when>
		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/jsp/registers.jsp">
			</c:import>
		</c:when>
		<c:when test="${ViewCategoryClicked}">
			<c:import url="/WEB-INF/jsp/viewitem.jsp">
			</c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${ProductPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${CategoryPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminCategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${SupplierPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminSupplier.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${AdminReportClicked} ">
			<c:import url="/WEB-INF/jsp/AdminReport.jsp">
			</c:import>
		</c:when>
	</c:choose>

	<!-- carousel -->
	<c:choose>
		<c:when test="${!Administrator}">
			<c:if test="${empty HideOthers}">
			<%-- <div>
					<div id="carousel-home" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li class="item1 active"></li>
							<li class="item2"></li>
							<li class="item3"></li>
							<li class="item4"></li>
							<li class="item5"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img
									src="<c:url value="http://www.nossaterra.com/wp-content/uploads/2014/10/nossaindigo.png"></c:url>"
									alt="instruments">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value=""></c:url>"
									alt="instruments">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="http://wallpapercave.com/wp/UJu9M7U.jpg"></c:url>"
									alt="instruments">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="http://wallpapercave.com/wp/UJu9M7U.jpg"></c:url>"
									alt="instruments">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="http://wallpapercave.com/wp/UJu9M7U.jpg"></c:url>"
									alt="instruments">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							</div>
						<!-- Controls -->
						<a class="left carousel-control" role="button"
							href="#carousel-home" style="color: black"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control " href="#carousel-home"
							role="button" style="color: black"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div> --%>
<br><br><br><br><br><br>				
				<div class="container">
<div id="myCarousel" class="carousel slide" data-ride="carousel" align="center">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://zawgyimart-12d3.kxcdn.com/image/55deb90242858c235a8b4567/1200/250" width="1200" height="250" alt="style">
      </div>

      <div class="item">

        <img src="http://icdn2.digitaltrends.com/image/android-n-developer-mem1-alternate-1200x250-c.png" width="1200" height="250" alt="pant">
      </div>

      <div class="item">
        <img src="https://zawgyimart-12d3.kxcdn.com/image/55deb89942858c255a8b4567/1200/250" width="1200" height="250" alt="pant">
      </div>    
  
      <div class="item">
        <img src="http://cdn3.focuscamera.com/media/wysiwyg/featured-brand/Samsung.jpg" width="1200" height="250" alt="Footwear">
      </div>

      <div class="item">
        <img src="http://cdn3.focuscamera.com/media/wysiwyg/featured-brand/20160208_OlympusFeaturedBrand.jpg" width="1200" height="250" alt="Eyewear">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div> 
</div>
			</c:if>
		</c:when>
	</c:choose>
	<!-- Corousel End -->


	<!-- Product List-->

	<c:if test="${empty HideOthers}">

		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${!empty productList6}">
					<div>
						<%-- <div align="center"
							style="background-color: #111111; height: 141px; padding-top: 20px">
							<img alt="Empty Cart"
								src="<c:url value="/resources/images/Black-Friday-Banner.jpg"></c:url>">


						</div> --%>
						<!-- <ul> -->
						<div class="row  "
							style="padding-top: 20px; padding-botton: 20px; padding-left: 20px; padding-bottom: 20px;">
							<!-- <h3 style="margin-left: 15px">Latest Products</h3> -->
							<c:forEach items="${productList6}" var="product">
								<div class="col-xs-2 w3-animate-zoom">
									<div class="img">
										<img height="192px" width="192px" alt="${product.id}"
											src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>">
										<div class="desc w3-black" style="opacity: 0.9">
											<p>
												${product.name}<br> <i class="fa fa-inr"
													aria-hidden="true"></i> ${product.price}
												<%-- <c:choose>
													<c:when test="${LoggedIn}">
														<form action="addtoCart/${userId}/${product.id}">
															<input type="number" value="1" name="quantity"
																class="btn btn-xs btn-primary   col-xs-6 "> <input
																type="submit" value="Add"
																class="btn btn-xs col-xs-6 btn-primary">
														</form>
													</c:when>
												</c:choose> --%>
											</p>

										</div>
									</div>
								</div>

								<%-- <li><a href=" ${product.id}" class="w3-hover-none">${product.name}</a></li>
								<li><img alt="Image"
									src="<c:url value="/WEB-INF/resources/images/product/${product.id}.jpg"></c:url>"></li>
								
								<c:choose>
									<c:when test="${LoggedIn}">
											<li><a href="addtoCart/${userId}/${product.id}"
						class="w3-hover-none">Add to Cart</a></li>
										<li>
											<form action="addtoCart/${userId}/${product.id}">
												<input type="number" value="1" name="quantity"> <input
													type="submit" value="Add to Cart">
											</form>
										</li>
									</c:when>
								</c:choose> --%>
							</c:forEach>
						</div>
						<!-- </ul> -->
					</div>
				</c:if>
			</c:when>
		</c:choose>
	</c:if>

	<%-- <div class="row w3-card-8 w3-margin" style="margin-bottom: 0px">
		<br>
		<div class="col-xs-2 ">
			<div class="thumbnail">
				<img height="150px" width="150px" alt="${product.id}"
					src="<c:url value="/WEB-INF/resources/images/product/Lap.jpg"></c:url>">
				<div class="caption">
					<p>
						<input type="number" value="1" name="quantity"
							class="btn btn-xs btn-primary   col-xs-6 "> <a href="#"
							class="btn btn-xs btn-primary col-xs-6" role="button">Add</a>
					</p>
				</div>
			</div>
		</div>
	</div> --%>
	<!-- Product List End -->

	<footer class="footer-distributed w3-card-4 w3-black w3-margin-0"
		style="opacity: 0.9">
		<div class="footer-left" style="margin-top: 10px">
			<!-- <p>Payment Options</p>
			<a href="#"><i class="fa fa-paypal" aria-hidden="true"></i> </a> . <a
				href="#"><i class="fa fa-cc-amex" aria-hidden="true"></i> </a> . <a
				href="#"><i class="fa fa-cc-mastercard" aria-hidden="true"></i>
			</a> . <a href="#"><i class="fa fa-cc-visa" aria-hidden="true"></i> </a>
			. <a href="#"><i class="fa fa-credit-card" aria-hidden="true"></i>
			</a> . <a href="#"><i class="fa fa-google-wallet" aria-hidden="true"></i>
			</a> . <a href="#"><i class="fa fa-cc-stripe" aria-hidden="true"></i>
			</a> -->
			<p></p>
			<p></p>
			<p>
				S H O P P I E E<i class="fa fa-copyright" aria-hidden="true"> 2016</i>
			</p>
			<p></p>
			<div class="footer-icons">
				<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-twitter"></i></a> <a href="#"><i
					class="fa fa-linkedin"></i></a>
			</div>
		</div>
		<div class="footer-center">
			<div>
				<i class="fa fa-map-marker"></i>
				<p>
					<span>LENIN,LIVIES</span>
				</p>
			</div>
			<div>
				<i class="fa fa-phone"></i>
				<p>+1 9177046135</p>
			</div>
			<div>
				<i class="fa fa-envelope"></i>
				<p>
					<a href="mailto:support@company.com">@ COMPANY</a>
				</p>
			</div>
		</div>
		<div class="footer-right">
			<p class="footer-company-about">
				<span>About the company</span> <a href="http://www.secura.e-sim.org"
					title="SHOPPIE, website template creation">S H O P P I E E </a>
					
			</p>
		</div>
	</footer>


	<!-- Carousel Script -->
	<!--  -->
	<script>
		$(document).ready(function() {
			// Activate Carousel
			$("#carousel-home").carousel();

			// Enable Carousel Indicators
			$(".item1").click(function() {
				$("#carousel-home").carousel(0);
			});
			$(".item2").click(function() {
				$("#carousel-home").carousel(1);
			});
			$(".item3").click(function() {
				$("#carousel-home").carousel(2);
			});
			$(".item4").click(function() {
				$("#carousel-home").carousel(3);
			});
			$(".item5").click(function() {
				$("#carousel-home").carousel(4);
			});
			$(".item6").click(function() {
				$("#carousel-home").carousel(5);
			});

			// Enable Carousel Controls
			$(".left").click(function() {
				$("#carousel-home").carousel("prev");
			});
			$(".right").click(function() {
				$("#carousel-home").carousel("next");
			});
		});
	</script>
	<!-- Carousel Script End  -->


</body>
</html>
