/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.StartupProjectsDTO;
import utils.DBUtils;

/**
 *
 * @author as
 */
public class StartupProjectsDAO implements IDAO<StartupProjectsDTO, String>{

    @Override
    public boolean create(StartupProjectsDTO entity) {
        return false;
    }

    @Override
    public List<StartupProjectsDTO> readAll() {
        return null;
    }

    @Override
    public StartupProjectsDTO readById(String id) {
        return null;
    }

    @Override
    public boolean update(StartupProjectsDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<StartupProjectsDTO> search(String searchTerm) {
        return null;
    }
    
     public List<StartupProjectsDTO> searchByName(String searchTerm) {
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name like ?";
        List<StartupProjectsDTO> list = new ArrayList<>();
         try {
             Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ps.setString(1, "%" + searchTerm + "%");
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {                 
                 StartupProjectsDTO sp = new StartupProjectsDTO(
                         rs.getInt("project_id"),
                         rs.getString("project_name"), 
                         rs.getString("Description"), 
                         rs.getString("Status"), 
                         rs.getInt("estimated_launch")); 
                list.add(sp);
             }
         } catch (Exception e) {
             System.out.println(e.toString());
         }
        return list;
         }

    }
