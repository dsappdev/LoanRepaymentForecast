
package com.dsappdev.loan;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;

/**
 * Reads the loan information from a text file in a pre-determined format.
 * 
 * @author Doug
 */
public class LoanReader {
       
    /**
     * Reads the loan information, assembles the loan object,
     * then places that loan into a hash map.
     * 
     * @param file - String value of the file's location path.
     * @return - hash map containing all of the individual loans. 
     *           Key: Loan Number 
     *           Value: the loan details
     * @throws IOException - general Java IO exception for file not found issues.
     */
    public HashMap<Integer, Loan> readLoanDataFromFile(String file) throws IOException {
        HashMap<Integer, Loan> loans = new HashMap<Integer, Loan>();
        BufferedReader inputStream = null;                 
        Loan loan;
        
        try {
            inputStream = new BufferedReader(new FileReader(file));
                        
            String content = inputStream.readLine();
            String description;
            String[] split;            
            int number = 0;
            double startPrin = 0.0d;
            double balance = 0.0d;
            double mnthPymt = 0.0d;
            double rate = 0.0d;
            double lastPymt = 0.0d;
            double intPaid = 0.0d;
            double prinPaid = 0.0d;
            LocalDate lastPymtDate = null;
            
            while (content != null) {                
                if (!content.equals("")) {                    
                    split = content.split(":");
                    description = split[0];
                    switch(description) {
                        case "Loan Number":
                            number = Integer.parseInt(split[1].trim());
                            break;
                        case "Original Principal":
                            startPrin = Double.parseDouble(split[1].trim());
                            break;
                        case "Principal Balance":
                            balance = Double.parseDouble(split[1].trim());
                            break;
                        case "Interest Rate":
                            rate = Double.parseDouble(split[1].trim());
                            break;
                        case "Monthly Payment":
                            mnthPymt = Double.parseDouble(split[1].trim());
                            break;
                        case "Last Payment Date":
                            lastPymtDate = LocalDate.parse(split[1].trim());
                            break;
                        case "Last Payment Amount":
                            lastPymt = Double.parseDouble(split[1].trim());
                            break;
                        case "Interest Paid":
                            intPaid = Double.parseDouble(split[1].trim());
                            break;
                        case "Principal Paid":
                            prinPaid = Double.parseDouble(split[1].trim());
                            break;                            
                    }
                }
                content = inputStream.readLine();
                if(content != null && !content.isEmpty()) {
                    loan = new Loan(number, startPrin, balance, rate, 
                            mnthPymt, lastPymtDate, lastPymt, intPaid, prinPaid);
                    loans.put(number, loan);
                }
            }            
        } finally {
            if(inputStream != null) {
                inputStream.close();
            }
        }
        return loans;
    }
    
    // Future: add read loan data from database
    
}
