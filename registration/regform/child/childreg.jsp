<%@ page import = "java.sql.*" %>

<%

String cname = request.getParameter("cname");
String cemail = request.getParameter("cemail");
String cworktime = request.getParameter("cworktime");
String cphone = request.getParameter("cphone");
String caddress = request.getParameter("caddress");
String file = request.getParameter("file");

try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctor","root","saran@mysql");
    PreparedStatement p = con.prepareStatement("insert into childregistration(cname,cemail,cworktime,cphone,caddress,file) values(?,?,?,?,?,?);");
    p.setString(1,cname);
    p.setString(2,cemail);
    p.setString(3,cworktime);
    p.setString(4,cphone);
    p.setString(5,caddress);
    p.setString(6,file);
    int x = p.executeUpdate();
    if(x>0)
    {

%>
  
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  background-color: black;
  font-family: Verdana;
}

.glow {
  font-size: 60px;
  color: #fff;
  text-align: center;
  animation: glow 1s ease-in-out infinite alternate;
  margin-top:15%;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}

</style>
</head>
<body>

<h1 class="glow">SUBMITTED SUCCESSFULLY</h1>
     
</body>
</html> 




<%       
    }
}
catch(Exception e)
{
    out.println(e);
}

%>