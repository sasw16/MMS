<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/dashboard.css" />"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />





<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/dashboard.js" />"></script>
<title>Patient Dashboard</title>
</head>


<body id="body-pd">
	<!-- Header -->
    <header class="header" id="header">
        <div class="container text-center">
            <div class="row h-100">
                <div class="col col-3"></div>
                <div class="col col-6 my-auto">
                    <h3>Patient Dashboard</h3>
                </div>
                <div class="col col-3 h-100 text-end">
                    <span><i class='bx bxs-user m-1'></i>
                        ${user.name}
                    </span>
                    <br>
                    <small>Patient ID: ${user.pid}</small>
                </div>
            </div>
        </div>
    </header>
	<div class="l-navbar" id="nav-bar">
		<nav class="nav">
			<div>
				<div class="nav_list">
					<a class="header_toggle nav_link"> <i
						class='bx bx-menu nav_icon' id="header-toggle"></i></a> <a
						href="patdash" class=" nav_link"> <i
						class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span>
					</a> <a href="patientprofile" class="nav_link"> <i
						class='bx bx-user nav_icon'></i> <span class="nav_name">My
							Profile</span>
					</a> <a href="editpatient" class=" nav_link"> <i
						class='bx bx-edit nav_icon'></i> <span class="nav_name">Edit
							Profile</span>
					</a> <a href="doctorlist" class="nav_link"> <i
						class='bx bx-group nav_icon'></i> <span class="nav_name">Doctors</span>
					</a> <a href="addappointment" class="nav_link active"> <i
						class='bx bx-calendar nav_icon'></i> <span class="nav_name">Book
							Appointment</span>
					</a>
				</div>
			</div>
			<a href="logout" class="nav_link"> <i
				class='bx bx-log-out nav_icon'></i> <span class="nav_name">Logout</span>
			</a>
		</nav>
	</div>
	<!-- Sidebar End -->


	<!--Container Main start-->
	<div class="container row d-flex body-container text-center justify-content-md-center">
        <h4>BOOK APPOINTMENTS</h4>
        <small>You can book appointments for the next 7 days.</small>
        <hr>
		<!-- Add Appointments Form -->
		
		<div class="row d-flex justify-content-center form-row text-start">
			<div class="col">
			
			<form action="filterdoctor" method="post" autocomplete="off">
			<div class="row d-flex justify-content-center form-row">
				<div class="form-group col-6">
					<label for="specialisation" class="form-label">Specialisation</label>
					<select id="specialisation" name="specialisation"
						class="form-select">
						<option selected>Choose Specialisation...</option>
						<option value="General Physician">General Physician</option>
						<option value="ENT">ENT</option>
						<option value="Cardiologist">Cardiologist</option>
						<option value="Neurologist">Neurologist</option>
					</select>
				</div>
				<div class="form-group col-4">
					<br>
					<button type="submit" class="btn btn-primary search-btn mt-2">
						<i class='bx bxs-search'></i> Search
					</button>
				</div>
			</div>
			</form>
			
			</div>
			
			
			<div class="col">
			
			
			<form action="filterdoctorname" method="post" autocomplete="off">
			<div class="row d-flex justify-content-center form-row">
				<div class="form-group col-5">
					<label for="namep" class="form-label">Name pattern</label><br>
					<input type="text" id="namep" placeholder="Search by name" name="filteredname" style="width:100%; height:34px; margin-top: 4px;"/>
				</div>
				<div class="form-group col-4">
					<br>
					<button type="submit" class="btn btn-primary search-btn mt-2">
						<i class='bx bxs-search'></i> Search
					</button>
				</div>
			</div>
			</form> 
			
			</div>
		</div>
		
		


		<c:if test="${allDoctors!=null && allDoctors.size()>0}">
        	<h4 class="mt-5">Available Doctors</h4>
        </c:if>
        <c:if test="${allDoctors.size()==0}">
        	<p class="lead mt-5">No doctor of selected specialisation is currently available</p>
        </c:if>


        <div class="row d-flex justify-content-center align-items-center text-center mt-2 mb-4">
        
	        <c:forEach items="${allDoctors}" var="doctor">
	            <div class="card col-md-2 col-sm-5 text-center m-4 p-2 doctor-card">
	            	<c:if test="${doctor.base64Image==null}">
	            		<img class="card-img-top img-doctor mt-2" src="<c:url value="/resources/images/user-img.png"/>" alt="Doctor Image">
	            	</c:if>
	            	<c:if test="${doctor.base64Image!=null}">
	                	<img class="card-img-top img-doctor mt-2" src="data:image/jpg;base64,${doctor.base64Image}" alt="Doctor Image">
	                </c:if>
	                <div class="card-body">
	                    <h5 class="card-title font-weight-bold">${doctor.name}</h5>
	                    <p>
	                        Specialisation: ${doctor.specialisation}
	                        <br>
	                        Fees: Rs ${doctor.fees}	                        <br>
	                        <c:choose>
									  <c:when test="${doctor.rating==0}">
									  Rating: No Reviews given
 									  </c:when>
									   <c:otherwise>
									   Rating: <span class="stars">${doctor.rating }</span>
									  </c:otherwise>
									
							</c:choose>
	                    </p>
						<form action="bookappointment" method="">
							<input type="hidden" value="${doctor.doc_id }" name="doc_id">
		                    <button type="submit" class="btn btn-primary btn-sm slot-btn">
		                        <i class='bx bxs-calendar'></i> Book Appointment
		                    </button>
		                </form>
	                </div>
	            </div>
	        </c:forEach>
	        
        </div>


	</div>
	<!--Container Main end-->
</body>

</html>