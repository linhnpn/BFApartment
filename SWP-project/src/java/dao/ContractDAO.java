/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ContractDTO;
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
public class ContractDAO {

    private static final String COUNT_CONTRACT = "Select COUNT(contractId) as [count] \n"
            + "FROM Contracts WHERE [status] LIKE ?";
    private static final String UPDATE_CONTRACT = "UPDATE Contracts\n"
            + "SET contractId = ?,\n"
            + "	startDate = ?,\n"
            + "	endDate = ?,\n"
            + "	[status] = ?,\n"
            + "	apartmentId = ?\n"
            + "	Where contractId = ?";
    private static final String LIST_CONTRACT = "SELECT Contracts.apartmentId, Contracts.startDate, Contracts.contractId, Owners.fullName, Owners.ownerId\n"
            + " FROM Contracts, Owners\n"
            + " WHERE Contracts.ownerId = Owners.ownerId AND Contracts.status = 1";
    private static final String GET_CONTRACT = "SELECT Contracts.apartmentId, Contracts.startDate, Contracts.contractId, Owners.fullName, Owners.ownerId, Contracts.endDate\n"
            + " FROM Contracts, Owners\n"
            + " WHERE Contracts.ownerId = Owners.ownerId AND Contracts.status = 1\n"
            + " AND Owners.userId = ?";
    private static final String DELETE_CONTRACT = "UPDATE Contracts SET status = ? WHERE contractId = ?";
    private static final String AD_SEARCH_CONTRACT = "SELECT A.contractId, C.apartmentId, B.fullName, A.startDate, A.endDate, A.[status]\n"
            + "            FROM Contracts A, Owners B, Apartments C\n"
            + "            WHERE  (A.contractId LIKE ? OR B.fullName LIKE ?)\n"
            + "                   AND A.ownerId=B.ownerId\n"
            + "                   AND A.apartmentId=C.apartmentId                   \n"
            + "                  ORDER BY A.status DESC, B.fullName, A.contractId;";
    private static final String INSERT_CONTRACT = "INSERT INTO Contracts(contractId, startDate, endDate, status, ownerId, apartmentId) VALUES(?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE_APARTMENT = "SELECT apartmentId FROM Contracts WHERE apartmentId =?";

    public boolean checkDuplicateOwner(String ownerId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT ownerId "
                        + " FROM Contracts "
                        + " WHERE ownerId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ownerId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }

    public boolean checkDuplicateApartment(String apartmentId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_APARTMENT);
                ptm.setString(1, apartmentId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }

    public boolean insertContract(ContractDTO contract) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Utils.getConnection();
            if ("".equals(contract.getEndDate())) {
                contract.setEndDate(null);
            }
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_CONTRACT);
                ptm.setString(1, contract.getContractId());
                ptm.setString(2, contract.getStartDate());
                ptm.setString(3, contract.getEndDate());
                ptm.setString(4, "1");
                ptm.setString(5, contract.getOwnerId());
                ptm.setString(6, contract.getApartmentId());
                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return check;
    }

    public boolean updateContract(ContractDTO contract) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if ("".equals(contract.getEndDate())) {
                contract.setEndDate(null);
            }
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_CONTRACT);
                stm.setString(1, contract.getContractId());
                stm.setString(2, contract.getStartDate());
                stm.setString(3, contract.getEndDate());
                stm.setString(4, contract.getStatus());
                stm.setString(5, contract.getApartmentId());
                stm.setString(6, contract.getContractId());
                check = stm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return check;
    }

    public boolean deleteContract(String contractId, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(DELETE_CONTRACT);
                stm.setString(1, "0");
                stm.setString(2, contractId);
                check = stm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return check;
    }

    public int countContract(String status) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_CONTRACT);
                ptm.setString(1, "%%" + status + "%%");
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

    public List<ContractDTO> getListContract_AD(String searchContract) throws SQLException {
        List<ContractDTO> listContract = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AD_SEARCH_CONTRACT);
                ptm.setString(1, "%" + searchContract + "%");
                ptm.setString(2, "%" + searchContract + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String contractId = rs.getString("contractId");
                    String apartmentId = rs.getString("apartmentId");
                    String fullName = rs.getString("fullName");
                    String startDate = rs.getString("startDate");
                    String endDate = rs.getString("endDate");
                    String status = rs.getString("status");
                    listContract.add(new ContractDTO(contractId, apartmentId, fullName, startDate, endDate, status));
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
        return listContract;
    }

    public List<ContractDTO> getListContract() throws SQLException {
        List<ContractDTO> listContract = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_CONTRACT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String contractId = rs.getString("contractId");
                    String apartmentId = rs.getString("apartmentId");
                    String fullName = rs.getString("fullName");
                    String startDate = rs.getString("startDate");
                    String ownerId = rs.getString("ownerId");
                    listContract.add(new ContractDTO(contractId, apartmentId, fullName, startDate, ownerId));
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
        return listContract;
    }

    public ContractDTO getContract(String userID) throws SQLException {
        ContractDTO contract = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CONTRACT);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String contractId = rs.getString("contractId");
                    String apartmentId = rs.getString("apartmentId");
                    String fullName = rs.getString("fullName");
                    String startDate = rs.getString("startDate");
                    String endDate = rs.getString("endDate");
                    String ownerId = rs.getString("ownerId");
                    contract = new ContractDTO(contractId, apartmentId, ownerId, startDate, endDate, ownerId);
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
        return contract;
    }

}
