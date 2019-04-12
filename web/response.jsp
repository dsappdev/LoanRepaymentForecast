<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Apr 4, 2019, 10:23:45 AM
    Author     : Doug
--%>
<%-- Adding a comment to push --%>
<sql:query var="loanDetailsQuery" dataSource="jdbc/LoanData">
    SELECT * FROM Loan
    WHERE loan_Number = ? <sql:param value="${param.loan_Number}"/>
</sql:query>
<sql:query var="pymtDtlsQuery" dataSource="jdbc/LoanData">
    SELECT payment_Date, amount_Paid, interest_Paid, principal_Paid FROM Payment
    WHERE loan_Number = ? <sql:param value="${param.lnNum}"/>
</sql:query>   
<c:set var="loanDetails" value="${loanDetailsQuery.rows[0]}"/>
<c:set var="pymtDetails" value="${pymtDtlsQuery.rows}"/>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--<title>Loan Details - {placeholder}</title> --%>
        <title>Loan Details</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">Loan Details for loan #${loanDetails.loan_Number}</th>
                </tr>
            </thead>
            <tbody>                
                <tr>
                    <td><strong>Original Principal: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${loanDetails.starting_Principal}</span></td>
                </tr>
                <tr>
                    <td><strong>Principal Balance: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${loanDetails.principal_Balance}</span></td>
                </tr>
                <tr>
                    <td><strong>Interest Rate: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${loanDetails.interest_Rate}</span></td>
                </tr>
                <tr>
                    <td><strong>First Payment Date: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${loanDetails.first_Payment_Date}</span></td>
                </tr>
                <tr>
                    <td><strong>Monthly Payment: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${loanDetails.monthly_Payment}</span></td>
                </tr>
                                             
            </tbody>
        </table>
        <table>
            <thead>
                <tr>Payment Details for Loan #${param.lnNum}</tr>
                <tr>                    
                    <th>Date of Payment</th>
                    <th>Payment Amount</th>
                    <th>Amount of Interest Paid</th>
                    <th>Amount of Principal Paid</th>
                </tr>
            </thead>     
            <tbody>           
                <c:forEach var="pymtRow" items="${pymtDetails}">
                <tr>
                    <td>${pymtRow.payment_Date}</td>
                    <td>${pymtRow.amount_Paid}</td>
                    <td>${pymtRow.interest_Paid}</td>
                    <td>${pymtRow.principal_Paid}</td>
                </tr>
                </c:forEach>           
            </tbody>
        </table>
                 
        <div id="backBtn"><a href="index.jsp"><button>Back</button></a></div>
               
    </body>
</html>
