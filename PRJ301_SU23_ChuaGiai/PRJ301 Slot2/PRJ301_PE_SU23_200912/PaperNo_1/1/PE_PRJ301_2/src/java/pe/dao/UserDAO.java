/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.model.UserDTO;
import pe.utils.DBUtils;

/**
 *
 * @author as
 */
public class UserDAO extends DBUtils{
    public UserDTO checkLogin (String userId, String password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [tblUsers] WHERE [userID] = ? AND [password] = ?";
        try {
            conn = getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userId);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userId, fullName, roleID, password);
                }               
            }
        } catch (Exception e){
            e.printStackTrace();
        }finally{
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
        return user;
    }
}
