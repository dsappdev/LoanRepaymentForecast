<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 
    Document   : index
    Created on : Apr 8, 2019, 4:39:57 PM
    Author     : Doug
--%>
<sql:query var="loans" dataSource="jdbc/LoanData">
    SELECT loan_Number FROM Loan
</sql:query>
<sql:query var="loansOverview" dataSource="jdbc/LoanData">
    SELECT * FROM Loan
</sql:query>
<c:set var="loanData" value="${loansOverview}" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Loan Amortization</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Loan Amortization</h1>
        <table>
            <thead>
                <tr>
                    <th>Update Payment Details</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To update the payment details of a specific loan, 
                        select its number from the list below</td>
                </tr>
                <tr>
                    <td>
                        <form action="newPaymentDetails.jsp">
                            <strong>Select a loan:</strong>
                            <select name="loan_Number">
                                <option></option>                               
                                <c:forEach var="row" items="${loans.rows}">
                                    <option value="${row.loan_Number}">${row.loan_Number}</option>
                                </c:forEach>                                
                            </select>
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
                
            </tbody>            
        </table>
        <table>
            <thead>
                <tr>
                    <th>Enter Details for Another Loan</th>
                </tr>
            </thead> 
            <tbody>
                <tr>
                    <td>Click the New Loan button to enter the details for
                        another loan.</td>
                </tr>
                <tr>
                    <td><div id="newLoanBtn"><a href="newLoanDetails.jsp"><button>New Loan</button></a></div></td>                    
                </tr>
            </tbody>
        </table>
        <table>
            <thead>
                <tr><td><strong>Overview for All Loans</strong></td></tr>
                <tr>
                    <th>Loan Number</th>
                    <th>Original Principal</th>
                    <th>Principal Balance</th>
                    <th>Interest Rate</th>
                    <th>Monthly Payment</th>
                    <th>Last Payment Date</th>
                    <th>
                </tr>
            </thead>
            <tbody>
            <%--<form>--%>
            <form action="response.jsp" method="GET">
                <%-- NEED TO HANDLE NO PAYMENT DATA FOUND for a loan
                    which exists but does not have any payment data --%>
                <c:forEach var="loanRow" items="${loanData.rows}">
                    <tr>
                        <%-- The input's NAME value is also the name of the parameter being passed --%>
                        <td><input type="submit" name="pymt_Loan_Number" value="${loanRow.loan_Number}"/></td> 
                        <td>${loanRow.starting_Principal}</td>
                        <td>${loanRow.principal_Balance}</td>
                        <td>${loanRow.interest_Rate}</td>
                        <td>${loanRow.monthly_Payment}</td>
                        <td>${loanRow.last_Payment_Date}</td>
                    </tr>
                </c:forEach>
            </form>
            </tbody>
        </table>
    </body>
</html>
