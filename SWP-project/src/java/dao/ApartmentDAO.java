/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ApartmentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Trieu Do
 */
public class ApartmentDAO {

    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
    private static final String COUNT_ROOM = "SELECT COUNT(apartmentId) AS [count]\n"
            + "FROM Apartments WHERE status = ?;";
    private static final String GET_TOTAL_APARTMENT = "SELECT count(*) FROM Apartments WHERE apartmentId LIKE ?";
    private static final String AD_SEARCH_APARTMENT = "SELECT A.apartmentId, A.size, A.image, B.buildingName, C.rentPrice, C.salePrice, [Status] = CASE [status]\n"
            + "WHEN 0 THEN 'Het phong' ELSE 'Con phong' END\n"
            + "FROM Apartments A, Buildings B, ApartmentTypes C\n"
            + "WHERE apartmentId LIKE ? and B.buildingId=A.buildingId and C.apartmentTypeId=A.apartmentTypeId\n"
            + "ORDER BY A.apartmentId ASC\n"
            + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
    private static final String UPDATE_APARTMENT = "UPDATE Apartments SET image = ?, status = ? WHERE apartmentId = ?";
    private static final String UPDATE_APARTMENT_PRICE = "UPDATE ApartmentTypes\n"
            + "SET rentPrice = ?, salePrice = ?\n"
            + "FROM Apartments A, ApartmentTypes B\n"
            + "WHERE A.apartmentTypeId=B.apartmentTypeId AND A.apartmentId LIKE ?";
    private static final String UPDATE_APARTMENT_STATUS = "UPDATE Apartments SET status = ? WHERE apartmentId like ?";

    public int countApartment(String status) throws SQLException {
        int count = 0;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_ROOM);
                ptm.setString(1, status);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = Integer.parseInt(rs.getString("count"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    public List<ApartmentDTO> getListApartment_AD(String searchApartment, int index) throws SQLException {
        List<ApartmentDTO> listApartment = new ArrayList<>();

        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AD_SEARCH_APARTMENT);
                ptm.setString(1, "%" + searchApartment + "%");
                ptm.setInt(2, (index - 1) * 10);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String apartmentId = rs.getString("apartmentId");
                    String size = rs.getString("size");
                    String image = rs.getString("image");
                    String buildingName = rs.getString("buildingName");
                    float rentPrice = Float.parseFloat(rs.getString("rentPrice"));
                    float salePrice = Float.parseFloat(rs.getString("salePrice"));
                    String status = rs.getString("status");
                    listApartment.add(new ApartmentDTO(apartmentId, size, image, buildingName, rentPrice, salePrice, status));
                }
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listApartment;
    }

    public int getTotalApartment(String search) {
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOTAL_APARTMENT);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return 0;
    }

    public boolean UpdateAprtmentPrice(ApartmentDTO apartmentPrice) throws SQLException {
        boolean check = false;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_APARTMENT_PRICE);
                ptm.setString(1, Float.toString(apartmentPrice.getRentPrice()));
                ptm.setString(2, Float.toString(apartmentPrice.getSalePrice()));
                ptm.setString(3, apartmentPrice.getApartmentId());

                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateApartmentStatus(String apartmentId, String status) throws SQLException {
        boolean check = false;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_APARTMENT_STATUS);
                ptm.setString(1, status);
                ptm.setString(2, apartmentId);
                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateApartment(ApartmentDTO apartment) throws SQLException {
        boolean check = false;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_APARTMENT);
                ptm.setString(1, apartment.getImage());
                ptm.setString(2, apartment.getStatus());
                ptm.setString(3, apartment.getApartmentId());

                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
