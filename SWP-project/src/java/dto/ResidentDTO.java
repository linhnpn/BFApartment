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
public class ResidentDTO {

    private String residentId;
    private String ownerId;
    private String name;
    private String dob;
    private boolean gender;
    private String job;
    private String email;
    private String phone;
    private boolean status;
    public String resquestId;

    public ResidentDTO(String ownerId, String name, String dob, boolean gender, String job, String email, String phone, boolean status) {
        this.ownerId = ownerId;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.job = job;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    public ResidentDTO(String userId, String ownerId, String name, String dob, boolean gender, String job, String email, String phone, boolean status) {
        this.residentId = userId;
        this.ownerId = ownerId;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.job = job;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ResidentDTO(String residentId, String ownerId, String name, String dob, boolean gender, String job, String phone, boolean status, String resquestId) {
        this.residentId = residentId;
        this.ownerId = ownerId;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.job = job;
        this.phone = phone;
        this.status = status;
        this.resquestId = resquestId;
    }

    public String getResquestId() {
        return resquestId;
    }

    public void setResquestId(String resquestId) {
        this.resquestId = resquestId;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public ResidentDTO() {
    }

    public String getResidentId() {
        return residentId;
    }

    public void setResidentId(String residentId) {
        this.residentId = residentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
