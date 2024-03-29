<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <title>Message Confirmation</title>
    <style>
        .center {
            text-align: center;
        }
        .bold {
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String message = request.getParameter("message");

String url = "jdbc:mysql://mysql:3306/contact";"
String user = admin
String password = System.getenv("dbpassword");

String smtpHost = System.getenv("smtpHost");
String smtpPort = "587";
String smtpUsername = System.getenv("smtpUsername");
String smtpPassword = System.getenv("smtpPassword");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        String sql = "INSERT INTO contact (name, email) VALUES (?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
        }
    }
    
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", smtpHost);
    props.put("mail.smtp.port", smtpPort);

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(smtpUsername, smtpPassword);
        }
    });

    MimeMessage mimeMessage = new MimeMessage(mailSession);
    mimeMessage.setFrom(new InternetAddress("abilanadar1998@gmail.com"));
    mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse("abilanadar1998@gmail.com"));
    mimeMessage.setSubject(subject);
    mimeMessage.setText(message);

    Transport.send(mimeMessage);
    out.println("<div class='center'><p class='bold'>Thanks for connecting with me</p></div>");
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
}
%>


</body>
</html>
