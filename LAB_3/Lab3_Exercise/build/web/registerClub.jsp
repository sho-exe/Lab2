<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Task 1</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>

    <center>
        <form id="memberFrm" action="processRegistration.jsp" method="post">
            <fieldset style="min-height: 400px">
                <legend>Member Registration</legend>
                <label for="name">Student Name : </label>
                <input type="text" id="name" name="name" size="15"
                       placeholder="" required><br/>

                <label for="matric">Matric Number : </label>
                <input type="text" id="matric" name="matric" size="15"
                       placeholder="" required><br/>

                <label for="club">Selected Club : </label>
                <select id="club" name="club" required>
                    <option value="" disabled selected>-- Select a Club --</option>
                    <option value="Programming Club">Programming Club</option>
                    <option value="Chess Club">Chess Club</option>
                    <option value="Economy Club">Economy Club</option>
                </select>
                <br/>
                <p>
                    <input type="submit" id="btnSubmit" value="Submit">
                    <input type="reset" id="btnCancel" value="Cancel">
                </p>

            </fieldset>
        </form>

        <%@ include file="footer.jsp" %>
    </center>
</body>
</html>
