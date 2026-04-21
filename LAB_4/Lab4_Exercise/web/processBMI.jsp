<%
    String weightStr = request.getParameter("weight");
    String heightStr = request.getParameter("height");

    double weight = 0;
    double height = 0;
    double bmi = 0;
    String category = "";

    try {
        weight = Double.parseDouble(weightStr);
        height = Double.parseDouble(heightStr);

        if (height > 0) {
            bmi = weight / (height * height);

            if (bmi < 18.5) {
                category = "Underweight";
            } else if (bmi >= 18.5 && bmi <= 25) {
                category = "Normal";
            } else {
                category = "Overweight";
            }
        }
    } catch (NumberFormatException e) {
        response.sendRedirect("bmiCalculator.jsp?error=invalid");
    }
//    
//
//session.setAttribute("bmiValue", bmi);
//session.setAttribute("bmiCategory", category);

%>

<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmiValue" value="<%= bmi %>" />
    <jsp:param name="bmiCategory" value="<%= category %>" />
</jsp:forward>