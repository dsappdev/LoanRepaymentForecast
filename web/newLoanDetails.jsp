<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : newLoanDetails
    Created on : Apr 10, 2019, 8:39:10 AM
    Author     : Doug
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>New Loan Page</title>
    </head>
    <body>
        <form method='POST'>
            <table>
                <thead>
                    <tr>
                        <th>Enter the details for a new loan</th>
                    </tr>    
                </thead>
                <tbody>
                    <tr>
                        <td>Enter the loan number: </td>
                        <td><input type="text" name="loanNum"></td>
                    </tr>
                    <tr>
                        <td>Enter the starting principal: </td>
                        <td><input type="text" name="startPrin"></td>
                    </tr>
                    <tr>
                        <td>Enter the principal balance: </td>
                        <td><input type="text" name="prinBal"></td>
                    </tr>
                    <tr>
                        <td>Enter the interest rate: </td>
                        <td><input type="text" name="intRate"></td>
                    </tr>
                    <tr>
                        <td>Enter the last payment date (YYYY-MM-DD): </td>
                        <td><input type="text" name="lastPayDate"></td>
                    </tr>
                    <tr>                        
                        <td>Enter the monthly payment: </td>
                        <td><input type="text" name="mnthPymt"></td>
                    </tr>                   
                    <tr>
                        <td></td>
                        <td><input type="submit" value="submit"></td>                   
                    </tr>                    
                </tbody>
            </table>            
        </form>
        <c:if test="${pageContext.request.method=='POST'}">
            <c:catch var="exception">
        <sql:update var="newLoan" dataSource="jdbc/LoanData">
            INSERT INTO Loan (loan_Number, starting_Principal, 
            principal_Balance, interest_Rate, first_Payment_Date, 
            monthly_Payment) 
            VALUES (?, ?, ?, ?, ?, ?);
            <sql:param value="${param.loanNum}" />
            <sql:param value="${param.startPrin}" />
            <sql:param value="${param.prinBal}" />
            <sql:param value="${param.intRate}" />
            <sql:param value="${param.lastPayDate}" />
            <sql:param value="${param.mnthPymt}" />          
        </sql:update>
        <c:if test="${newLoan>=1}">
            <font size='5' color='green'> The loan details have been entered. 
                Hit the back button to return to the home page.</font>                
        </c:if>
        </c:catch>
        <c:if test="${exception!=null}">
            <c:out value="Unable to enter details" />
        </c:if>
        </c:if> 
        <%-- Cannot go into the form because of the if checking if the data has been submitted  --%>
        
        <table>
            <tr><td id="backBtn"><a href="index.jsp"><button>Back</button></a></td></tr>
        </table>
    </body>
</html>
