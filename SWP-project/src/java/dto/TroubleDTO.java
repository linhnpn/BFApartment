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
public class TroubleDTO {

    private String troubleId;
    private String apartment;
    private String ownerName;
    private String date;
    private String typeName;
    private String detail;
    private boolean status;

    public TroubleDTO() {
    }

    public TroubleDTO(String troubleId, String apartment, String ownerName, String date, String typeName, String detail, boolean status) {
        this.troubleId = troubleId;
        this.apartment = apartment;
        this.ownerName = ownerName;
        this.date = date;
        this.typeName = typeName;
        this.detail = detail;
        this.status = status;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getTroubleId() {
        return troubleId;
    }

    public void setTroubleId(String troubleId) {
        this.troubleId = troubleId;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
