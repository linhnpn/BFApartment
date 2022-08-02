/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Nhat Linh
 */
public class ResidentError {

    private String nameError;
    private String dobError;
    private String sexError;
    private String jobError;
    private String phoneError;
    private String emailError;

    public ResidentError() {
        this.nameError = "";
        this.dobError = "";
        this.sexError = "";
        this.jobError = "";
        this.phoneError = "";
        this.emailError = "";
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public ResidentError(String nameError, String dobError, String sexError, String jobError, String phoneError, String emailError) {
        this.nameError = nameError;
        this.dobError = dobError;
        this.sexError = sexError;
        this.jobError = jobError;
        this.phoneError = phoneError;
        this.emailError = emailError;
    }

    public ResidentError(String nameError, String dobError, String sexError, String jobError, String phoneError) {
        this.nameError = nameError;
        this.dobError = dobError;
        this.sexError = sexError;
        this.jobError = jobError;
        this.phoneError = phoneError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getDobError() {
        return dobError;
    }

    public void setDobError(String dobError) {
        this.dobError = dobError;
    }

    public String getSexError() {
        return sexError;
    }

    public void setSexError(String sexError) {
        this.sexError = sexError;
    }

    public String getJobError() {
        return jobError;
    }

    public void setJobError(String jobError) {
        this.jobError = jobError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

}
