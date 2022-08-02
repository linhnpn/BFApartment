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
public class BillDTO {

    private String billId;
    private double total;
    private boolean status;
    private String date;
    private String apartmentId;

    public BillDTO(String billId, double total, boolean status, String date, String apartmentId) {
        this.billId = billId;
        this.total = total;
        this.status = status;
        this.date = date;
        this.apartmentId = apartmentId;
    }

    public BillDTO(double total, String date) {
        this.total = total;
        this.date = date;
    }

    public BillDTO() {
    }

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getApartmentId() {
        return apartmentId;
    }

    public void setApartmentId(String apartmentId) {
        this.apartmentId = apartmentId;
    }
}
