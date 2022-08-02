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
public class DetailBill {

    private String Id;
    private String name;
    private float price;
    private String createDate;
    private float priceDetail;
    private int newIndex;
    private int oldIndex;
    private int usageIndex;
    private String date;

    public DetailBill() {
    }

    public DetailBill(String Id, String name, float price, String createDate, float priceDetail, int newIndex, int oldIndex, int usageIndex, String date) {
        this.Id = Id;
        this.name = name;
        this.price = price;
        this.createDate = createDate;
        this.priceDetail = priceDetail;
        this.newIndex = newIndex;
        this.oldIndex = oldIndex;
        this.usageIndex = usageIndex;
        this.date = date;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public float getPriceDetail() {
        return priceDetail;
    }

    public void setPriceDetail(float priceDetail) {
        this.priceDetail = priceDetail;
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

    public int getUsageIndex() {
        return usageIndex;
    }

    public void setUsageIndex(int usageIndex) {
        this.usageIndex = usageIndex;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
