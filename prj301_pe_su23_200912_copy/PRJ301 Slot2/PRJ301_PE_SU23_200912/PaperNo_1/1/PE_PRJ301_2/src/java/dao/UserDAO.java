/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.tblUsers;
import pe.utils.DBUtils;

/**
 *
 * @author as
 */
public class UserDAO extends DBUtils {

    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    public tblUsers findByTkMk(String userId, String password) {
        try {
            //tao ket noi DB
            connection = DBUtils.getConnection();
            //chuan bi cau lenh
            String sql = "SELECT *\n"
                    + "FROM tblUsers\n"
                    + "where [userID] = ? and [password] = ?";
            //chuan bi prepared statement
            statement = connection.prepareStatement(sql);
            //set parameter neu co
            statement.setObject(1, userId);
            statement.setObject(2, password);
            //tra ve du lieu
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                tblUsers user = new tblUsers();
                user.setUserID(resultSet.getString("userID"));
                user.setFullName(resultSet.getString("fullName"));
                user.setRoleID(resultSet.getString("roleID"));
                user.setPassword(resultSet.getString("password"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                //Dong ket noi va cac tai nguyen
                if (resultSet != null) {
                    resultSet.close();
                } 
                if  (statement != null){
                    statement.close();
                }
                if  (connection != null){
                    connection.close();
                }
            } catch (Exception e) {
                System.out.println("4USER: Bắn Exception ở hàm query: " + e.getMessage());
            }
        }

        return null;
    }
    
        public static void main(String[] args) {
            System.out.println(new UserDAO().findByTkMk("QL002", "1"));
    }
}
