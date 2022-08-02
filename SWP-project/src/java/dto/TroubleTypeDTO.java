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
public class TroubleTypeDTO {
    private String typeId;
    private String detail;

    public TroubleTypeDTO(String typeId, String detail) {
        this.typeId = typeId;
        this.detail = detail;
    }

    public TroubleTypeDTO() {
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
}
