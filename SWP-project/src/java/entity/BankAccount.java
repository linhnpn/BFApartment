/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

/**
 *
 * @author Minh Hoàng
 */
public class BankAccount {
    private String accountNum;
    private String accountName;
    private String bankId;
    private double blance;
    private String PIN;

    public String getAccountNum() {
        return accountNum;
    }

    public void setAccountNum(String accountNum) {
        this.accountNum = accountNum;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    public double getBlance() {
        return blance;
    }

    public void setBlance(double blance) {
        this.blance = blance;
    }

    public String getPIN() {
        return PIN;
    }

    public void setPIN(String PIN) {
        this.PIN = PIN;
    }

    public BankAccount() {
    }

    public BankAccount(String accountNum, String accountName, String bankId, double blance, String PIN) {
        this.accountNum = accountNum;
        this.accountName = accountName;
        this.bankId = bankId;
        this.blance = blance;
        this.PIN = PIN;
    }
    
}
