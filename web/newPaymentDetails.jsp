<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : newPaymentDetails
    Created on : Apr 15, 2019, 8:44:35 AM
    Author     : Doug
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>New Payment Details</title>
    </head>
    <body>
        <form method='POST'>
            <table>
                <thead>
                    <tr>
                        <th>Enter the payment details for loan #${param.loan_Number}</th>
                    </tr>    
                </thead>
                <tbody>
                    <tr>                        
                        <td>Enter the payment amount: </td>
                        <td><input type="text" name="pymtAmt"></td>
                    </tr>
                    <tr>                        
                        <td>Enter the payment date (YYYY-MM-DD): </td>
                        <td><input type="text" name="pymtDate"></td>
                    </tr>                    
                    <tr>                        
                        <td>Enter the amount of interest paid: </td>
                        <td><input type="text" name="intPaid"></td>
                    </tr>
                    <tr>                        
                        <td>Enter the amount of principal paid: </td>
                        <td><input type="text" name="prinPaid"></td>
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
        <sql:update var="newPymt" dataSource="jdbc/LoanData">
            INSERT INTO Payment (loan_Number, amount_Paid, payment_Date, 
            interest_Paid, principal_Paid)
            VALUES (?, ?, ?, ?, ?); 
            <sql:param value="${param.loan_Number}" />
            <sql:param value="${param.pymtAmt}" />
            <sql:param value="${param.pymtDate}" />
            <sql:param value="${param.intPaid}" />
            <sql:param value="${param.prinPaid}" />
        </sql:update>        
        <c:if test="${newPymt>=1}">
            <font size='5' color='green'> The payment details have been entered. 
                Hit the back button to return to the home page.</font>                
        </c:if>
        </c:catch>
        <c:if test="${exception!=null}">
            <c:out value="Unable to enter details" />
        </c:if>
        </c:if>
        <table>
            <tr><td id="backBtn"><a href="index.jsp"><button>Back</button></a></td></tr>
        </table>
    </body>
</html>
