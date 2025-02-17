/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.SQLException;
import dao.UserDAO;

/**
 *
 * @author as
 */
public class LoginDAO extends DBUtils{
    private Connection conn;

    public LoginDAO() throws ClassNotFoundException, SQLException {
        conn = getConnection();
    }
    
    
    
    public UserDAO findUser(String UserID, String pass) {
       
    }
    
}
