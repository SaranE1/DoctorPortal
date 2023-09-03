<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "doctor";
    String userid = "root";
    String password = "saran@mysql";
    try 
    {
        Class.forName(driver);
    } 
    catch (ClassNotFoundException e) 
    {
        out.println("Connection not found");
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<body>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
        .styled-table 
        {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            font-size : 18px;
            font-weight: bold;
            color:white;
        }
        .styled-table thead tr 
        {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }
        .styled-table th,
        .styled-table td 
        {
            padding: 10px 40px;
        }
        .styled-table tbody tr 
        {
            border-bottom: 1px solid #dddddd;
        }
        /* .styled-table tbody tr:nth-of-type(even) 
        {
            background-color: #f3f3f3;
            
        } */
        .styled-table tbody tr:last-of-type 
        {
            border-bottom: 2px solid #009879;
        }
        .styled-table tbody tr.active-row 
        {
            font-weight: bold;
            color:white;
        }
        .row
        {
            margin-left : 0%;
        }
        .heading
        {
            margin-left : 33%;
            font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
            color : white;  

        }
        .button
        {
            margin-left : 43%;
        }
        body 
        {
            background-image: url('./kidbg.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }
 
    </style>
</head>

<body>
<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
                <br>
					<h2 class="heading">KIDS SPECIALIST DOCTORS</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="styled-table">
                        <br>
						    <thead>
						        <tr>
						    	    <th>Email</th>
						    	    <th>Doctor name</th>
						            <th>Phone</th>
						            <th>Visiting hours</th>
						            <th>Clinic address</th>
                                </tr>
                            </thead>
                            <tbody>

</tr>

<%
    try
    {
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql = "select * from doctor.nursery";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next())
        {
%>


<tr class="alert" role="alert">
    <td class="status"><%=resultSet.getString("email")%></td>
    <td class="status"><%=resultSet.getString("name")  %></td>
    <td class="status"><%=resultSet.getString("phone") %></td>
    <td class="status"><%=resultSet.getString("worktime")  %></td>
    <td class="status"><%=resultSet.getString("address")   %></td>
</tr>


    
<%
        }
        connection.close();
    } 
    catch (Exception e) 
    {
        e.printStackTrace();
    }
%>

                            </tbody>
						</table>
					</div>
                    <section class = "button">
                    <a href = "../nursery.html"><button>Register</button>
                    </section>
				</div>
			</div>
		</div>
	</section>
</body>
 
</body>
</html>