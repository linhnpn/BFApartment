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
public class ContractDTO {

    private String contractId;
    private String apartmentId;
    private String fullName;
    private String serviceName;
    private String startDate;
    private String endDate;
    private String status;
    private String ownerId;

    public ContractDTO() {
    }

    public ContractDTO(String contractId, String apartmentId, String fullName, String serviceName, String startDate, String endDate, String status) {
        this.contractId = contractId;
        this.apartmentId = apartmentId;
        this.fullName = fullName;
        this.serviceName = serviceName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public ContractDTO(String contractId, String apartmentId, String ownerId, String startDate, String endDate, String status) {
        this.contractId = contractId;
        this.apartmentId = apartmentId;
        this.ownerId = ownerId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public ContractDTO(String contractId, String apartmentId, String fullName, String startDate, String ownerId) {
        this.contractId = contractId;
        this.apartmentId = apartmentId;
        this.fullName = fullName;
        this.startDate = startDate;
        this.ownerId = ownerId;
    }

    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getApartmentId() {
        return apartmentId;
    }

    public void setApartmentId(String apartmentId) {
        this.apartmentId = apartmentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

}
