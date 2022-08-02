/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import utils.Utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minh Hoàng
 */
public class UserDAO {

    private static final String GET_OWNER = "Select ownerId FROM Owners where userId = ?";
    private static final String CHECK_LOGIN = "SELECT roleId FROM Accounts WHERE userId =? AND password=? AND status = 1";
    private static final String INSERT_USER = "INSERT INTO Accounts(userId, password, status, roleId) VALUES(?,?,?,?)";
    private static final String GET_LIST_USER = "SELECT Accounts.userId, roleId, Accounts.status, Owners.ownerId FROM Accounts FULL OUTER JOIN Owners ON Accounts.userId= Owners.userId WHERE Accounts.userId like ?";
    private static final String UPDATE_USER = "UPDATE Accounts SET roleID=? WHERE userID=?";
    private static final String DELETE_USER = "UPDATE Accounts SET status=0 WHERE userId=?";
    private static final String CHECK_DUP_USER = "SELECT userId FROM Accounts WHERE userId=?";
    private static final String GET_APARTMENT = "SELECT Apartments.apartmentId\n"
            + "FROM Apartments, Contracts, Owners\n"
            + "WHERE Apartments.apartmentId = Contracts.apartmentId\n"
            + "	AND Contracts.ownerId = Owners.ownerId\n"
            + "	AND Owners.userId = ?";
    private static final String CHECK_PASS = "SELECT password FROM Accounts WHERE userId = ?";
    private static final String CHANGE_PASSWORD = "Update Accounts SET password = ? WHERE userId = ?";
    private static final String CHECK_USER = "SELECT Owners.phone, Accounts.userId\n"
            + " FROM Accounts, Owners\n"
            + " WHERE Accounts.userId = Owners.userId\n"
            + "	AND Accounts.userId = ?;";

    public UserDTO checkUser(String userId) throws ClassNotFoundException, SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_USER);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String phone = rs.getString("phone");
                    String userID = rs.getString("userId");
                    user = new UserDTO(userID, phone);
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean updatePass(String userId, String password) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHANGE_PASSWORD);
                stm.setString(1, password);
                stm.setString(2, userId);
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

    public boolean checkPass(String userId, String password) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_PASS);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    if (rs.getString("password").equals(password)) {
                        check = true;
                    }
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public String getApartment(String userId) throws SQLException, ClassNotFoundException {
        String apartmentId = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_APARTMENT);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    apartmentId = rs.getString("apartmentId");
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return apartmentId;
    }

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_LOGIN);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleId");
                    user = new UserDTO(userID, "***", roleID);
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_DUP_USER);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public String getOwnerId(String userID) throws SQLException, ClassNotFoundException {
        String ownId = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_OWNER);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    ownId = rs.getString("ownerId");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return ownId;
    }

    public boolean insertUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT_USER);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getPassword());
                stm.setInt(3, 1);
                stm.setString(4, user.getRoleID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_LIST_USER);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String roleID = rs.getString("roleID");
                    int status = rs.getInt("status");
                    String password = "***";
                    String ownerId = rs.getString("ownerId");
                    if (ownerId == null || "NULL".equals(ownerId)) {
                        ownerId = "";
                    }
                    if (status == 1) {
                        list.add(new UserDTO(userID, roleID, password, ownerId));
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_USER);
                stm.setString(1, user.getRoleID());
                stm.setString(2, user.getUserID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean deleteUser(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(DELETE_USER);
                stm.setString(1, userID);
                int value = stm.executeUpdate();
                result = value > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
