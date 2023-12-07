<%@page import="com.studentresultmanagement.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	try {
		String rollNo = request.getParameter("rollNo");
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
				"select * from student inner join result on student.rollNo=result.rollNo and student.rollNo='"
						+ rollNo + "'");
		if (rs.next()) {
			
%>





<img src="logo.png" align="left" width="150" height="150">

<a href="dgiOneView.html">Back</a>
<hr class="new1">
<style>
table {
	width: 100%;
	table-layout: fixed;
}

th {
	padding: 20px 15px;
	text-align: left;
	font-weight: 500;
	font-size: 12px;
	color: #fff;
	text-transform: uppercase;
	border: 2px solid rgba(255, 255, 255, 0.3);
}

/* demo styles */
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

body {
	background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	background: linear-gradient(to right, #25c481, #25b7c4);
	font-family: 'Roboto', sans-serif;
}
</style>
<!--for demo wrap-->
<div class="tbl-header">
	<table cellpadding="0" cellspacing="0" border="0">
		<thead>
			<tr>
				<th>institution Name:MG University</th>
				<th>Course Name:<%=rs.getString(1)%></th>
				<th>Branch Name:<%=rs.getString(2)%></th>
				<th><center>
						RollNo:<%=rs.getString(3)%></center></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>Name: <%=rs.getString(4)%></th>
				<th>Father Name:<%=rs.getString(5)%></th>
				<th>Gender: <%=rs.getString(6)%></th>
				<th><a titlt="print screen" alt="print screen"
					onclick="window.print();" target="_blank" style="cursor: pointer;"><center>
							<img src="print.png">
						</center></a></th>
			</tr>
		</thead>
	</table>
</div>
<style>
html {
	font-family: arial;
	font-size: 25px;
}

td {
	border: 2px solid #726E6D;
	padding: 15px;
	color: black;
	text-align: center;
}

thead {
	font-weight: bold;
	text-align: center;
	background: #625D5D;
	color: white;
}

table {
	border-collapse: collapse;
}

.footer {
	text-align: right;
	font-weight: bold;
}

tbody>tr:nth-child(odd) {
	background: #D1D0CE;
}
</style>
<head>
<hr class="new1">
</head>
<body>
	<table>
		<thead>
			<tr>
				<td colspan="3">Course</td>
				<td rowspan="2">Type</td>
				<td rowspan="2">Full Marks</td>
				<td rowspan="2">Passing Marks</td>
				<td rowspan="2">Obtained Marks</td>

			</tr>
			<tr>
				<td>Code</td>
				<td colspan="2">Name</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>NAS101</td>
				<td colspan="2">Subject1</td>
				<td>Theory</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(8)%></td>
			</tr>
			<tr>
				<td>NAS102</td>
				<td colspan="2">Subject2</td>
				<td>Theory</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(9)%></td>
			</tr>
			<tr>
				<td>NAS103</td>
				<td colspan="2">Subject3</td>
				<td>Theory</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(10)%></td>
			</tr>
			<tr>
				<td>NEE101</td>
				<td colspan="2">Subject4</td>
				<td>Theory</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(11)%></td>
			</tr>
			<tr>
				<td>NEC101</td>
				<td colspan="2">Subject5</td>
				<td>Theory</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(12)%></td>
			</tr>
			<tr>
				<td>NAS152</td>
				<td colspan="2">Lab1</td>
				<td>Practical</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(13)%></td>
			</tr>
			<tr>
				<td>NAS151</td>
				<td colspan="2">Lab2</td>
				<td>Practical</td>
				<td>100</td>
				<td>30</td>
				<td><%=rs.getString(14)%></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" class="footer">Total Marks</td>
				<td>700</td>
				<td>350</td>
				<td>
					<%
						int sum = rs.getInt(8) + rs.getInt(9) + rs.getInt(10) + rs.getInt(11) + rs.getInt(12)
										+ rs.getInt(13) + rs.getInt(14);
								out.println(sum);
					%>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="footer">Percentage</td>
				<td colspan="3">
					<%
						out.println((sum * 100) / 700);
					%>
				</td>
			</tr>
	</table>

</body>

<%
	} else {
			
			response.sendRedirect("errorDgiOneView.html");
		}

	} catch (Exception e) {
	}
%>


