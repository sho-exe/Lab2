
<html>
    <head>
        <title>JSP Implicit Objects</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Insurance Quotation</h1>
            <div class="card">
                <form action="processInsuranceQuo.jsp">

                    <fieldset>
                        <legend>Insurance Quotation</legend>   

                        <label for="icno">IC No* </label>
                        <input type="text" id="icno" name="icno" size="15"
                               placeholder="E.g. 021218-05-3451" required><br/>

                        <label for="name">Name* </label>
                        <input type="text" id="name" name="name" size="15"
                               placeholder="Enter Name" required><br/>

                        <label for="price">Market Price* </label>
                        <input type="number" id="price" name="price" size="15"
                               placeholder="Price" required><br/>

                        <label for="coverage">Coverage Type </label>
                        <select name="coverage" required>
                            <option value="third">Third Party</option>
                            <option value="comprehensive">Comprehensive</option>
                        </select><br>

                        <label for="ncd">No Claims Discount (NCD)</label>
                        <select name="ncd">
                            <option value="0.10">10%</option>
                            <option value="0.20">20%</option>
                            <option value="0.55">55%</option>

                        </select><br>
                        
                        
                        
                        
                        <p>
                            <input type="submit" id="btnSubmit" value="Submit">
                            <input type="reset" id="btnCancel" value="Cancel">
                        </p>


                    </fieldset>
                </form> 

            </div>
        </div>

    </body>
</html>
