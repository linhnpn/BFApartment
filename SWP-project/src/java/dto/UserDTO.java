/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Minh Hoàng
 */
public class UserDTO {

    private String userID;
    private String roleID;
    private String password;
    private String phone;
    private String ownerId;

    public UserDTO() {
    }

    public UserDTO(String userID, String roleID, String password, String ownerId) {
        this.userID = userID;
        this.roleID = roleID;
        this.password = password;
        this.ownerId = ownerId;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public UserDTO(String userID, String password, String roleID) {
        this.userID = userID;
        this.roleID = roleID;
        this.password = password;
    }

    public UserDTO(String userID, String phone) {
        this.userID = userID;
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
