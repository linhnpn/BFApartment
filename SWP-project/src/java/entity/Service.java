/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Minh Hoàng
 */
public class Service {

    private String serviceId;
    private String serviceName;
    private Date createdDate;
    private int status;
    private String typeID;
    private float price;
    private float priceDetail;

    public Service(String serviceId, String serviceName, float servicePrice, Date date, float priceDetail) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.createdDate = date;
        this.priceDetail = priceDetail;
        this.price = servicePrice;
    }

    public Service(String serviceId, String serviceName, float price) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.price = price;
    }

    public String getTypeID() {
        return typeID;
    }

    public void setTypeID(String typeID) {
        this.typeID = typeID;
    }

    public Service() {
    }

    public Service(String serviceId, String serviceName, Date createdDate, int status, String typeID, float price, float priceDetail) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.createdDate = createdDate;
        this.status = status;
        this.typeID = typeID;
        this.price = price;
        this.priceDetail = priceDetail;
    }

    public Service(String serviceId, String serviceName, int status, float price) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.status = status;
        this.price = price;
    }

    public Service(String serviceId, String serviceName, Date createdDate, int status, String typeID, float price) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.createdDate = createdDate;
        this.typeID = typeID;
        this.status = status;
        this.price = price;
    }

    public String getServiceId() {
        return serviceId;
    }

    public float getPriceDetail() {
        return priceDetail;
    }

    public void setPriceDetail(float priceDetail) {
        this.priceDetail = priceDetail;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Service{" + "serviceId=" + serviceId + ", serviceName=" + serviceName + ", createdDate=" + createdDate + ", status=" + status + ", price=" + price + '}';
    }

}
