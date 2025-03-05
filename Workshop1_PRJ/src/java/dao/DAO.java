/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.DTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author HP
 */
public class DAO implements IDAO<DTO, String>{

    @Override
    public boolean create(DTO entity) {
        String sql = "Insert [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) "
                + "Values (?, ?, ?, ?)";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getUsername());
            ps.setString(2, entity.getName());
            ps.setString(3, entity.getPassword());
            ps.setString(4, entity.getRole());
            int n = ps.executeUpdate();
            return n>0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<DTO> readAll() {
        List<DTO> list = new ArrayList<>();
        String sql = "Select * from [tblUsers]";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                DTO user = new DTO(
                rs.getString("Username"),
                rs.getString("Name"),
                rs.getString("Password"),
                rs.getString("Role"));
                list.add(user);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public DTO readbyID(String id) {
        String sql = "Select * from [tblUsers] where Username= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                DTO user = new DTO(
                        rs.getString("Username"),
                        rs.getString("Name"),
                        rs.getString("Password"),
                        rs.getString("Role"));
                return user;
            } } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    

    @Override
    public boolean update(DTO entity) {
        String sql = "Update [tblUsers] set"
                + "[Name]=?, "
                + "[Password]=?, "
                + "[Role]=?, "
                + "where [Username]=?";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getUsername());
            ps.setString(2, entity.getName());
            ps.setString(3, entity.getPassword());
            ps.setString(4, entity.getRole());
            int n = ps.executeUpdate();
            return n>0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<DTO> search(String searchTerm) {
        List<DTO> list = new ArrayList<>();
        String sql = "Select [Username], [Name], [Password], [Role] From [tblUsers]"
                + "Where [Username] Like ?"
                + "OR [Name] like ?"
                + "OR [Role] like ?";
        try (
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            String searchPattern  = "%" + searchTerm + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);
            try(ResultSet rs = ps.executeQuery()){
                while (rs.next()){
                    DTO user = new DTO(rs.getString("Username"),
                            rs.getString("Name"),
                            rs.getString("Password"),
                            rs.getString("Role"));
                    list.add(user);
            }
        }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
