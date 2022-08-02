/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Trieu Do
 */
public class ApartmentDTO {

    private String apartmentId;
    private String size;
    private String image;
    private String apartmentTypeId;
    private String buildingID;
    private String buildingName;
    private String typeName;
    private float rentPrice;
    private float salePrice;
    private String status;

    public ApartmentDTO() {
    }

    public ApartmentDTO(String apartmentId, String image) {
        this.apartmentId = apartmentId;
        this.image = image;
    }

    public ApartmentDTO(String apartmentId, String image, float rentPrice, float salePrice, String status) {
        this.apartmentId = apartmentId;
        this.image = image;
        this.rentPrice = rentPrice;
        this.salePrice = salePrice;
        this.status = status;
    }

    public ApartmentDTO(String apartmentId, String size, String image, String status, String apartmentTypeId, String buildingID) {
        this.apartmentId = apartmentId;
        this.size = size;
        this.image = image;
        this.status = status;
        this.apartmentTypeId = apartmentTypeId;
        this.buildingID = buildingID;
    }

    public ApartmentDTO(String apartmentId, String size, String image, String buildingName, float rentPrice, float salePrice, String status) {
        this.apartmentId = apartmentId;
        this.size = size;
        this.image = image;
        this.status = status;
        this.buildingName = buildingName;
        this.rentPrice = rentPrice;
        this.salePrice = salePrice;
    }

    public String getApartmentId() {
        return apartmentId;
    }

    public void setApartmentId(String apartmentId) {
        this.apartmentId = apartmentId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getApartmentTypeId() {
        return apartmentTypeId;
    }

    public void setApartmentTypeId(String apartmentTypeId) {
        this.apartmentTypeId = apartmentTypeId;
    }

    public String getBuildingID() {
        return buildingID;
    }

    public void setBuildingID(String buildingID) {
        this.buildingID = buildingID;
    }

    public float getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(float rentPrice) {
        this.rentPrice = rentPrice;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
