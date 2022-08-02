/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RequestDTO;
import dto.ResidentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Nhat Linh
 */
public class ResidentDAO {

    private static final String SEARCH_BY_NAME = "SELECT residentId, ownerId, fullName, dob, sex, job, phone FROM "
            + " Residents WHERE (fullName LIKE ? OR ownerId LIKE ?) and status = 1\n"
            + " ORDER BY Residents.residentId ASC\n"
            + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
    private static final String LIST_RESIDENT_BY_USERID = "SELECT Residents.residentId, Residents.ownerId, Residents.fullName, Residents.dob, Residents.sex, Residents.job, Residents.phone FROM \n"
            + "             Residents, Owners WHERE Residents.status = 1\n"
            + "			 AND Residents.ownerId = Owners.ownerId\n"
            + "			 AND Owners.userId = ?\n"
            + "             ORDER BY Residents.residentId ASC";
    private static final String SEARCH_RES_OWN = "SELECT ownerId as residentId, ownerId, fullname, dob, sex, job, phone FROM "
            + " Owners WHERE (fullName LIKE ? OR ownerId LIKE ?) and status =1\n"
            + " ORDER BY OwnerId ASC\n"
            + " OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
    private static final String SEARCH_RES_OWN_V2 = "SELECT ownerId as residentId, ownerId, fullname, dob, sex, job, phone FROM \n"
            + " Owners WHERE Owners.userId = ? and status =1\n"
            + " ORDER BY OwnerId ASC";
    private static final String SEARCH_BY_NAME_OWN = "SELECT Residents.residentId, Residents.ownerId, Residents.fullName, "
            + "Residents.dob, Residents.sex, Residents.job, Residents.phone FROM "
            + "Residents, Owners WHERE Residents.ownerId = Owners.ownerId"
            + " AND Owners.userId LIKE ? AND Residents.status = 1";
    private static final String GET_INDEX_REQUEST = "SELECT requestId from Requests";
    private static final String ADD_RESIDENT = "INSERT INTO Residents(residentId, fullName, dob, sex, job, phone, status, requestId, ownerId) "
            + " VALUES (? , ? , ? , ? , ? , ? , 0 , ? , ? )";
    private static final String UPDATE_RESIDENT = "UPDATE Residents SET requestId = ? WHERE residentId = ?";
    private static final String UPDATE_INFO_RESIDENT = "UPDATE Residents \n"
            + " SET fullName = ?,\n"
            + "	dob = ?,\n"
            + "	sex = ?,\n"
            + "	job = ?,\n"
            + "	phone = ?,\n"
            + "	status = ?\n"
            + " WHERE residentId = ?";
    private static final String UPDATE_OWNER = "UPDATE Owners \n"
            + " SET fullName = ?,\n"
            + "	dob = ?,\n"
            + "	sex = ?,\n"
            + "	job = ?,\n"
            + "	phone = ?,\n"
            + "	status = ?\n"
            + " WHERE ownerId = ?";
    private static final String INSERT_REQUEST = "INSERT INTO Requests VALUES (?, ?, ?, ?)";
    private static final String VIEW_REQUEST_RESIDENT = "SELECT Requests.requestId, Residents.ownerId, Residents.residentId, Residents.fullName, Residents.sex, "
            + " Residents.dob, Residents.phone, Residents.status, Residents.job"
            + " FROM Requests, Residents "
            + " WHERE Requests.requestId = Residents.requestId "
            + " AND Requests.status = 0 "
            + " AND Residents.requestId = ?";
    private static final String VIEW_REQUEST = "SELECT requestId, Requests.ownerId, Owners.fullName, Requests.action\n"
            + "FROM Requests, Owners\n"
            + "WHERE Requests.ownerId = Owners.ownerId\n"
            + "	AND Requests.status = 0\n"
            + "	ORDER BY action, requestId";
    private static final String VIEW_REQUEST_V2 = "SELECT requestId, Requests.ownerId, Owners.fullName, Requests.action\n"
            + "FROM Requests, Owners\n"
            + "WHERE Requests.ownerId = Owners.ownerId\n"
            + "	AND Requests.status = 0\n"
            + " AND Owners.userId = ?\n"
            + "	ORDER BY action, requestId";
    private static final String UPDATE_REQUEST = "UPDATE Requests\n"
            + " SET [status] = 1\n"
            + " WHERE requestId = ?";
    private static final String ADD_OWNER = "INSERT INTO Owners VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_REQUEST_RESIDENT = "UPDATE Residents\n"
            + " SET [status] = ?\n"
            + " WHERE requestId = ?";
    private static final String COUNT_RESIDENT = "SELECT COUNT(residentId) as [count]\n"
            + "  FROM Residents";
    private static final String COUNT_RESIDENT_V2 = "SELECT COUNT(residentId) as [count]\n"
            + "  FROM Residents WHERE (fullName LIKE ? OR ownerId LIKE ?) and status LIKE ?";
    private static final String COUNT_OWNER = "SELECT COUNT(ownerId) as [count]\n"
            + "  FROM Owners WHERE (fullName LIKE ? OR ownerId LIKE ?) and status LIKE ?";
    private static final String COUNT_RESIDENT_BY_OWNERID = "SELECT COUNT(Residents.residentId) as [count]\n"
            + " FROM Residents, Owners WHERE Residents.ownerId = Owners.ownerId\n"
            + " AND Owners.ownerId = ? AND Residents.status = 1";
    private static final String REMOVE_OWNER = "Update Owners SET [status] = 0 WHERE ownerId = ?";
    private static final String REMOVE_RESIDENT = "Update Residents SET [status] = 0 WHERE residentId = ?";

    public int countResidentByOwnerID(String ownerId) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_RESIDENT_BY_OWNERID);
                ptm.setString(1, ownerId);
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

    public int countResident() throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_RESIDENT);
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

    public boolean updateRequestResident(String requestId, String action) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_REQUEST_RESIDENT);
                if ("add".equals(action)) {
                    stm.setString(1, "1");
                } else {
                    stm.setString(1, "0");
                }
                stm.setString(2, requestId);
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

    public boolean updateRequest(String requestId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_REQUEST);
                stm.setString(1, requestId);
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

    public List<RequestDTO> getListRequest() throws SQLException {
        List<RequestDTO> listRequest = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_REQUEST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String requestId = rs.getString("requestId");
                    String ownerId = rs.getString("ownerId");
                    String action = rs.getString("action");
                    String name = rs.getString("fullName");
                    listRequest.add(new RequestDTO(requestId, ownerId, action, name, false));
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
        return listRequest;
    }

    public List<RequestDTO> getListRequest(String userId) throws SQLException {
        List<RequestDTO> listRequest = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_REQUEST_V2);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String requestId = rs.getString("requestId");
                    String ownerId = rs.getString("ownerId");
                    String action = rs.getString("action");
                    String name = rs.getString("fullName");
                    listRequest.add(new RequestDTO(requestId, ownerId, action, name, false));
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
        return listRequest;
    }

    public List<ResidentDTO> getListRequestRes(String requestId) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_REQUEST_RESIDENT);
                ptm.setString(1, requestId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String residentId = rs.getString("residentId");
                    String ownerId = rs.getString("ownerId");
                    String name = rs.getString("fullName");
                    String dob = rs.getString("dob");
                    boolean gender = Utils.getBoolean(rs.getString("sex"));
                    String job = rs.getString("job");
                    String phone = rs.getString("phone");
                    String req = rs.getString("requestId");
                    String status = rs.getString("status");
                    boolean check = false;
                    if ("1".equals(status)) {
                        check = true;
                    }
                    listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, check, req));
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
        return listResident;

    }

    public boolean updateResident(String requestId, String residentId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_RESIDENT);
                stm.setString(1, requestId);
                stm.setString(2, residentId);
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

    public List<ResidentDTO> getListResidentV2(String input) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_NAME_OWN);
                ptm.setString(1, input + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String residentId = rs.getString("residentId");
                    String ownerId = rs.getString("ownerId");
                    String name = rs.getString("fullName");
                    String dob = rs.getString("dob");
                    boolean gender = Utils.getBoolean(rs.getString("sex"));
                    String job = rs.getString("job");
                    String phone = rs.getString("phone");
                    String req = "";
                    listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true, req));
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
        return listResident;
    }

    private List<ResidentDTO> getListOwner(String search, int index) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_RES_OWN);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                ptm.setInt(3, (index - 1) * 5);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String residentId = rs.getString("residentId");
                    String ownerId = rs.getString("ownerId");
                    String name = rs.getString("fullName");
                    String dob = rs.getString("dob");
                    boolean gender = Utils.getBoolean(rs.getString("sex"));
                    String job = rs.getString("job");
                    String phone = rs.getString("phone");
                    String req = "";
                    listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true, req));
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
        return listResident;
    }

    private List<ResidentDTO> getListOwner(String userId) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_RES_OWN_V2);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String residentId = rs.getString("residentId");
                    String ownerId = rs.getString("ownerId");
                    String name = rs.getString("fullName");
                    String dob = rs.getString("dob");
                    boolean gender = Utils.getBoolean(rs.getString("sex"));
                    String job = rs.getString("job");
                    String phone = rs.getString("phone");
                    String req = "";
                    listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true, req));
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
        return listResident;
    }

    public List<ResidentDTO> getListResident(String userId) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                List<ResidentDTO> listOwner = getListOwner(userId);
                listResident.addAll(listOwner);
                ptm = conn.prepareStatement(LIST_RESIDENT_BY_USERID);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String residentId = rs.getString("residentId");
                    String ownerId = rs.getString("ownerId");
                    String name = rs.getString("fullName");
                    String dob = rs.getString("dob");
                    boolean gender = Utils.getBoolean(rs.getString("sex"));
                    String job = rs.getString("job");
                    String phone = rs.getString("phone");
                    String req = "";
                    listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true, req));
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

        return listResident;
    }

    public List<ResidentDTO> getListResident(String search, int index) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                List<ResidentDTO> listOwner = getListOwner(search, index);
                listResident.addAll(listOwner);
                if (listResident.size() < 5 && !listResident.isEmpty()) {
                    ptm = conn.prepareStatement(SEARCH_BY_NAME);
                    ptm.setString(1, "%" + search + "%");
                    ptm.setString(2, "%" + search + "%");
                    ptm.setInt(3, 0);
                    ptm.setInt(4, 5 - listResident.size());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String residentId = rs.getString("residentId");
                        String ownerId = rs.getString("ownerId");
                        String name = rs.getString("fullName");
                        String dob = rs.getString("dob");
                        boolean gender = Utils.getBoolean(rs.getString("sex"));
                        String job = rs.getString("job");
                        String phone = rs.getString("phone");
                        String req = "";
                        listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true, req));
                    }
                } else if (listResident.isEmpty()) {
                    int countOwner = countOwner(search, "1");
                    int countPage = (countOwner + 5 - 1) / 5;
                    int offset = countPage * 5 - countOwner + (index - countPage - 1) * 5;
                    ptm = conn.prepareStatement(SEARCH_BY_NAME);
                    ptm.setString(1, "%" + search + "%");
                    ptm.setString(2, "%" + search + "%");
                    ptm.setInt(3, offset);
                    ptm.setInt(4, 5);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String residentId = rs.getString("residentId");
                        String ownerId = rs.getString("ownerId");
                        String name = rs.getString("fullName");
                        String dob = rs.getString("dob");
                        boolean gender = Utils.getBoolean(rs.getString("sex"));
                        String job = rs.getString("job");
                        String phone = rs.getString("phone");
                        String req = "";
                        listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true, req));
                    }
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
        return listResident;
    }

    public int getIndexRequest() throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_INDEX_REQUEST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count++;
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

    public boolean addResident(ResidentDTO res) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ADD_RESIDENT);
                stm.setString(1, res.getResidentId());
                stm.setString(2, res.getName());
                stm.setString(3, res.getDob());
                if (res.isGender() == true) {
                    stm.setString(4, "male");
                } else {
                    stm.setString(4, "female");
                }
                stm.setString(5, res.getJob());
                stm.setString(6, res.getPhone());
                stm.setString(7, res.getResquestId());
                stm.setString(8, res.getOwnerId());
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

    public boolean insertRequest(String req, String ownerId, String action, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT_REQUEST);
                stm.setString(1, req);
                stm.setString(2, action);
                stm.setString(3, status);
                stm.setString(4, ownerId);
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

    public boolean updateResident(ResidentDTO resident) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_INFO_RESIDENT);
                stm.setString(1, resident.getName());
                stm.setString(2, resident.getDob());
                stm.setString(3, resident.isGender() ? "male" : "female");
                stm.setString(4, resident.getJob());
                stm.setString(5, resident.getPhone());
                stm.setString(6, resident.isStatus() ? "1" : "0");
                stm.setString(7, resident.getResidentId());
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

    public boolean updateOwner(ResidentDTO resident) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_OWNER);
                stm.setString(1, resident.getName());
                stm.setString(2, resident.getDob());
                stm.setString(3, resident.isGender() ? "male" : "female");
                stm.setString(4, resident.getJob());
                stm.setString(5, resident.getPhone());
                stm.setString(6, resident.isStatus() ? "1" : "0");
                stm.setString(7, resident.getOwnerId());
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

    public boolean removeOwner(String ownerId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(REMOVE_OWNER);
                stm.setString(1, ownerId);
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

    public boolean removeResident(String residentId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(REMOVE_RESIDENT);
                stm.setString(1, residentId);
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

    public int countOwner(String search, String status) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_OWNER);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                ptm.setString(3, "%" + status + "%");
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

    public int countResident(String status, String search) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_RESIDENT_V2);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                ptm.setString(3, "%" + status + "%");
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = Integer.parseInt(rs.getString("count"));
                }
                count += countOwner(search, status);
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

    public boolean addOwner(ResidentDTO owner) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ADD_OWNER);
                stm.setString(1, owner.getOwnerId());
                stm.setString(2, owner.getName());
                stm.setString(3, owner.getDob());
                if (owner.isGender() == true) {
                    stm.setString(4, "male");
                } else {
                    stm.setString(4, "female");
                }
                stm.setString(5, owner.getJob());
                stm.setString(6, owner.getPhone());
                stm.setString(7, owner.getEmail());
                stm.setString(8, "1");
                stm.setString(9, owner.getResidentId());
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
}
