
package org.solent.odd.bank.model.dto;

import java.util.Date;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import javax.swing.JOptionPane;
import org.solent.ood.bank.model.dto.BankTransactionStatus;

/**
 *
 * @author satod
 */


public class logger {
    
    private Integer code;

    private String message;

    private BankTransactionStatus status;

    private String fromCardNo;

    private String toCardNo;

    private String transactionId;

    private Date transactionDate;
    
    private Double amount;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public BankTransactionStatus getStatus() {
        return status;
    }

    public void setStatus(BankTransactionStatus status) {
        this.status = status;
    }

    public String getFromCardNo() {
        return fromCardNo;
    }

    public void setFromCardNo(String fromCardNo) {
        this.fromCardNo = fromCardNo;
    }

    public String getToCardNo() {
        return toCardNo;
    }

    public void setToCardNo(String toCardNo) {
        this.toCardNo = toCardNo;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public void main(String[] args)     {
        String code1 = String.valueOf(code);
        String message1 = String.valueOf(message);
        String status1 = String.valueOf(status);
        String fromCardNo1 = String.valueOf(fromCardNo);
        String toCardNo1 = String.valueOf(toCardNo);
        String transactionId1 = String.valueOf(transactionId);
        String transactionDate1 = String.valueOf(transactionDate);
        String amount1 = String.valueOf(amount);
        String filepath = "logger.txt";
        
        saveRecord(code1,message1,status1,fromCardNo1,toCardNo1,transactionId1,transactionId1,transactionDate1,amount1,filepath);
                
    }
    
    public void saveRecord(String code1, String message1, String status1, String fromCardNo1, String toCardNo1, String transactionId1, String transactionDate1, String amount1, String filepath1, String filepath){
        try
        {
            FileWriter fw = new FileWriter(filepath,true);
            BufferedWriter bw = new BufferedWriter(fw);
            PrintWriter pw = new PrintWriter(bw);
            
            pw.println(code+","+message+","+status+","+fromCardNo+","+toCardNo+","+transactionId+","+transactionDate+","+amount);
            pw.flush();
            pw.close();
            
            JOptionPane.showMessageDialog(null,"Record saved");
            
        }
        catch(Exception E)
        {
            JOptionPane.showMessageDialog(null,"Record not saved");
        }
    } 
}
