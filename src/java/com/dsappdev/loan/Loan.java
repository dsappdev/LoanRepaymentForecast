/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dsappdev.loan;

import java.time.LocalDate;

/**
 * A class to represent the basic structure of a loan including 
 * payment information.
 * 
 * @author Doug
 */
public class Loan {
    int loanNumber = 0;
    double originalPrincipal = 0.0d;
    double principalBalance = 0.0d;
    double interestRate = 0.0d;
    double monthlyPayment = 0.0d;
    LocalDate lastPaymentDate = null;
    double lastPaymentAmount = 0.0d;
    double interestPaid = 0.0d;
    double principalPaid = 0.0d;
    
    
    public Loan() {}
    
    /**
     * Constructor for the details that will typically remain unchanged.
     * 
     * @param loanNumber - int value representing the loan's identifying number
     * @param originalPrincipal - double value of the amount borrowed.
     * @param principalBalance - double value of the current balance of the loan.
     * @param interestRate - double value for the interest rate (compounded daily)
     * @param monthlyPayment  - double value for the minimum payment each month.
     */
    public Loan(int loanNumber, double originalPrincipal, 
            double principalBalance, double interestRate, 
            double monthlyPayment) {
        this.loanNumber = loanNumber;
        this.originalPrincipal = originalPrincipal;
        this.principalBalance = principalBalance;
        this.interestRate = interestRate;
        this.monthlyPayment = monthlyPayment;        
    }
    
    /**
     * Constructor which expands the loan details to include the details 
     * surrounding loan payment information.
     * 
     * @param loanNumber - int value representing the loan's identifying number
     * @param originalPrincipal - double value of the amount borrowed.
     * @param principalBalance - double value of the current balance of the loan.
     * @param interestRate - double value for the interest rate (compounded daily)
     * @param monthlyPayment  - double value for the minimum payment each month.
     * @param lastPaymentDate - LocalDate value of the last date a payment was made.
     * @param lastPaymentAmount - double value representing the last payment amount.
     * @param interestPaid - double value for the amount of the payment that went to interest.
     * @param principalPaid - double value for the amount of the payment that went to principal.
     */
    public Loan(int loanNumber, double originalPrincipal, 
            double principalBalance, double interestRate, double monthlyPayment,
            LocalDate lastPaymentDate, double lastPaymentAmount, double interestPaid,
            double principalPaid) {
        this.loanNumber = loanNumber;
        this.originalPrincipal = originalPrincipal;
        this.principalBalance = principalBalance;
        this.interestRate = interestRate;
        this.monthlyPayment = monthlyPayment;
        this.lastPaymentDate = lastPaymentDate;
        this.lastPaymentAmount = lastPaymentAmount;
        this.interestPaid = interestPaid;
        this.principalPaid = principalPaid;    
    }

    public int getLoanNumber() {
        return loanNumber;
    }

    public void setLoanNumber(int loanNumber) {
        this.loanNumber = loanNumber;
    }

    public double getOriginalPrincipal() {
        return originalPrincipal;
    }

    public void setOriginalPrincipal(double originalPrincipal) {
        this.originalPrincipal = originalPrincipal;
    }

    public double getPrincipalBalance() {
        return principalBalance;
    }

    public void setPrincipalBalance(double principalBalance) {
        this.principalBalance = principalBalance;
    }

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(float interestRate) {
        this.interestRate = interestRate;
    }

    public double getMonthlyPayment() {
        return monthlyPayment;
    }

    public void setMonthlyPayment(double monthlyPayment) {
        this.monthlyPayment = monthlyPayment;
    }

    public LocalDate getLastPaymentDate() {
        return lastPaymentDate;
    }

    public void setLastPaymentDate(LocalDate lastPaymentDate) {
        this.lastPaymentDate = lastPaymentDate;
    }

    public double getLastPaymentAmount() {
        return lastPaymentAmount;
    }

    public void setLastPaymentAmount(double lastPaymentAmount) {
        this.lastPaymentAmount = lastPaymentAmount;
    }

    public double getInterestPaid() {
        return interestPaid;
    }

    public void setInterestPaid(double interestPaid) {
        this.interestPaid = interestPaid;
    }

    public double getPrincipalPaid() {
        return principalPaid;
    }

    public void setPrincipalPaid(double principalPaid) {
        this.principalPaid = principalPaid;
    }

    @Override
    public String toString() {
        return "Loan Details for Loan #" + loanNumber + "\n"
                + "Original Principal: " + originalPrincipal + "\n"
                + "Principal Balance: " + principalBalance + "\n"
                + "Interest Rate: " + interestRate + "\n"
                + "Monthly Payment: " + monthlyPayment + "\n"
                + "Last Payment Date: " + lastPaymentDate + "\n"
                + "Last Payment Amount: " + lastPaymentAmount + "\n"
                + "Interest Paid: " + interestPaid + "\n"
                + "Principal Paid: " + principalPaid + "\n";
    }    
}