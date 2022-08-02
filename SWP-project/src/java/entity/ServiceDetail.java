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
public class ServiceDetail {  							
    public String serviceDetailId;
    public int newIndex;
    public int oldIndex;
    public int usagaIndex;
    public float price;
    public float total;
    public Date date;
    public String serviceId;

    public ServiceDetail() {
    }

    public ServiceDetail(String serviceDetailId, int newIndex, int oldIndex, float price, Date date,String serviceId) {
        this.serviceDetailId = serviceDetailId;
        this.newIndex = newIndex;
        this.oldIndex = oldIndex;
        this.usagaIndex = newIndex - oldIndex;
        this.price = price;
        this.total = this.usagaIndex * price ;
        this.date = date;
        this.serviceId = serviceId;
    }

    public String getDetailId() {
        return serviceDetailId;
    }

    public void setDetailId(String detailId) {
        this.serviceDetailId = detailId;
    }


    public int getNewIndex() {
        return newIndex;
    }

    public void setNewIndex(int newIndex) {
        this.newIndex = newIndex;
    }

    public int getOldIndex() {
        return oldIndex;
    }

    public void setOldIndex(int oldIndex) {
        this.oldIndex = oldIndex;
    }


    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getServiceDetailId() {
        return serviceDetailId;
    }

    public void setServiceDetailId(String serviceDetailId) {
        this.serviceDetailId = serviceDetailId;
    }

    public int getUsagaIndex() {
        return usagaIndex;
    }

    public void setUsagaIndex(int usagaIndex) {
        this.usagaIndex = usagaIndex;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    @Override
    public String toString() {
        return "ServiceDetail{" + "serviceDetailId=" + serviceDetailId + ", newIndex=" + newIndex + ", oldIndex=" + oldIndex + ", usagaIndex=" + usagaIndex + ", price=" + price + ", total=" + total + ", date=" + date + ", serviceId=" + serviceId + '}';
    }



   
    
}
