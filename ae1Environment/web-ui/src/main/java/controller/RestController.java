/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.solent.com504.oodd.bank.model.dto.CreditCard;
import org.solent.com504.oodd.bank.client.impl.BankRestClientImpl;
import org.solent.com504.oodd.bank.model.client.BankRestClient;
import org.solent.com504.oodd.bank.model.dto.BankTransactionStatus;
import org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage;
import properties.PropertiesDao;
import properties.WebObjectFactory;
import solent.ac.uk.ood.examples.cardcheck.CalculateLunnDigit;
import solent.ac.uk.ood.examples.cardcheck.CardValidationResult;
import solent.ac.uk.ood.examples.cardcheck.RegexCardValidator;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
/**
 *
 * @author Cristian Anton Frincu
 */
public class RestController {
    public static final PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    public static final String BANK_URL = propertiesDao.getProperty("rest_url");
    public static final BankRestClient client = new BankRestClientImpl(BANK_URL);
    public static final Logger log = LogManager.getLogger(RestController.class);
    public static CreditCard cardFrom = null;
    public static CreditCard cardTo = null;

    public static TransactionReplyMessage handleTransaction(CreditCard cardFrom, CreditCard cardTo, double amount) {
        log.debug("Transaction action was called.");
        return client.transferMoney(cardFrom, cardTo, amount);
    }


    public static TransactionReplyMessage handleRefund(CreditCard cardTo, CreditCard cardFrom, double amount) {
        log.debug("Refund action was called.");
        return client.transferMoney(cardTo, cardFrom, amount);
    }
    public static String handleLunnCode(CreditCard cardTo) {
        log.debug("Check Credit Card action was called.");
        return RegexCardValidator.isValid(cardTo.getCardnumber()).getMessage();
        
        
    }


    public static String handleRequest(HttpServletRequest request) {
        // get action    
        String action = request.getParameter("action");
        // get form details
        String sender_ccnumber = request.getParameter("sender_ccnumber");
        String sender_cvv = request.getParameter("sender_cvv");
        String sender_endDate = request.getParameter("sender_endDate");
        String sender_issueNum = request.getParameter("sender_issueNum");
        String sender_name = request.getParameter("sender_name");
        double amount = Double.parseDouble(request.getParameter("amount"));

        // get recipient details
        String recipient_name = propertiesDao.getProperty("recipient_name");
        String recipient_ccnumber = propertiesDao.getProperty("recipient_ccnumber");
        String recipient_issueNum = propertiesDao.getProperty("recipient_issueNum");
        String recipient_endDate = propertiesDao.getProperty("recipient_endDate");
        String recipient_cvv = propertiesDao.getProperty("recipient_cvv");

        // set cards
        cardFrom = new CreditCard();
        cardFrom.setCardnumber(sender_ccnumber);
        cardFrom.setCvv(sender_cvv);
        cardFrom.setEndDate(sender_endDate);
        cardFrom.setIssueNumber(sender_issueNum);
        cardFrom.setName(sender_name);
        //Card To
        cardTo = new CreditCard();
        cardTo.setCardnumber(recipient_ccnumber);
        cardTo.setCvv(recipient_cvv);
        cardTo.setEndDate(recipient_endDate);
        cardTo.setIssueNumber(recipient_issueNum);
        cardTo.setName(recipient_name);

        if (null != action) switch (action) {
            case "transaction":
                return handleTransaction(cardFrom, cardTo, amount).toString();
            case "refund":
                return handleRefund(cardTo, cardFrom, amount).toString();
            case "lunn":
                return handleLunnCode(cardFrom);
            default:
                break;
        }
        return "Error!";
    }

}
