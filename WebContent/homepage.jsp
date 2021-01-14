<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/design.css" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>QR code Generation</title>
</head>
<body>

	<div class="jumbotron text-center header">
		<h1>QR code Generator</h1>
		<p>Generate your customize QR right now!</p>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h3>Example for QR Code Generation</h3>
				<p>Fill the details like this form in the below to generate your
					own QR code</p>
				<hr />
				<p>
					Here the QR code generated through the example... <br /> You can
					Scan or download it too..
				</p>
				<div class="row ">
					<div class="col-sm-6 text-center">
						<img alt="QR" src="QRs/myQR.png" class="img-responsive" />
						<p>**ps : if You can not see above QR code the kindly generate
							it again my clicking the button given in the example</p>
					</div>
					<div class="col-sm-6 text-center">
						<div class="form-group">

							<div class="col-sm-10">
								<a href="QRs/myQR.png" target="_blank"><input type="button"
									class="form-control" id="download" value="Download this QR" /></a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-sm-6">
				<h3>Example</h3>

				<p>This QR code will contain a predefined link specified by the
					developer.</p>
				<hr />

				<form class="form-horizontal" action="controller" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" value="myQR"
								disabled="disabled" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="link">Link:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="link"
								value="https://www.linkedin.com/in/banshita-gangwar-744790183/"
								disabled="disabled" />
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" name="action"
								value="Generate QR">Generate QR</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- ===================================dynamic qr========================================== -->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h3>Generate your QR Code</h3>

				<p>Fill the form given beside to generate your QR...</p>
				<hr />

				<c:if test="${not empty values }">
					<div class="row ">
						<p>
							Here's Your QR code!!! <br /> Download it
						</p>
						<div class="col-sm-6 text-center">
							<img alt="QR" src="QRs/${name}.png" class="img-responsive" />
							<p>**ps : If you are unable to view your QR code then either
								click on download or refresh</p>
						</div>
						<div class="col-sm-6 text-center">
							<div class="form-group">

								<div class="col-sm-10">
									<a href="QRs/${name}.png" target="_blank"><input type="button"
										class="form-control" id="download" value="Download this QR" /></a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="col-sm-6">
				<h3>Fill the form to generate your QR code</h3>
				<p>One click away from your QR code</p>
				<hr />
				<form class="form-horizontal" action="controller" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Enter name" required />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="link">Link:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="link" name="link"
								placeholder="Enter link " required />
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" name="action"
								value="Generate QR">Generate QR</button>
						</div>
					</div>

				</form>
			</div>

		</div>
	</div>
	<!-- <footer class="text-center">

	<h5>Developed by Banshita Gangwar</h5>
	</footer> -->

	<div class="container footer">
		<div class="row text-center">
			<h5>Developed by Banshita Gangwar</h5>
			<ul>
				<li>Follow on :&nbsp;</li>
				<li><a
					href="https://www.linkedin.com/in/banshita-gangwar-744790183/"
					target="_blank"><i class="fa fa-linkedin-square"
						aria-hidden="true"></i></a></li>
				<li><a href="https://github.com/banshita209/" target="_blank"><i
						class="fa fa-github-square" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>

</body>
</html>