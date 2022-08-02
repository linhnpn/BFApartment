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
public class PasswordError {

    private String oldPassError;
    private String newPassError;
    private String reNewPassError;

    public PasswordError(String oldPassError, String newPassError, String reNewPassError) {
        this.oldPassError = oldPassError;
        this.newPassError = newPassError;
        this.reNewPassError = reNewPassError;
    }

    public PasswordError() {
    }

    public String getOldPassError() {
        return oldPassError;
    }

    public void setOldPassError(String oldPassError) {
        this.oldPassError = oldPassError;
    }

    public String getNewPassError() {
        return newPassError;
    }

    public void setNewPassError(String newPassError) {
        this.newPassError = newPassError;
    }

    public String getReNewPassError() {
        return reNewPassError;
    }

    public void setReNewPassError(String reNewPassError) {
        this.reNewPassError = reNewPassError;
    }

}
