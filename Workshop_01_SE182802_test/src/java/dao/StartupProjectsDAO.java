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
public class StartupProjectsDAO implements IDAO<StartupProjectsDTO, String> {

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
        // 1. Kiểm tra xem danh sách có dữ liệu không
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ?";
        List<StartupProjectsDTO> list = new ArrayList<>();

        // 2. Kiem tra ket noi database
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) {
                System.out.println("Khong the ket noi Database!");
                return list;
            }
            System.out.println("Ket noi database oke!");

            // 3. thiet lap tham so truy van
            ps.setString(1, "%" + searchTerm + "%");

            // 4. thuc thi truy van
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new StartupProjectsDTO(
                            rs.getInt("project_id"),
                            rs.getString("project_name"),
                            rs.getString("Description"),
                            rs.getString("Status"),
                            rs.getDate("estimated_launch")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 5. Kiem tra so luong ket qua
        //System.out.println("So luong ket qua tim thay: " + list.size());
        return list;
    }

    public List<StartupProjectsDTO> searchByName2(String searchTerm) {
        // 1. Kiem tra xem danh sach co du lieu khong
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ? AND YEAR(estimated_launch) = 2025";
        List<StartupProjectsDTO> list = new ArrayList<>();

        // 2. Kiem tra ket noi database
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) {
                System.out.println("Khong the ket noi Database!");
                return list;
            }
            System.out.println("Ket noi database oke!");

            // 3. thiet lap tham so truy van
            ps.setString(1, "%" + searchTerm + "%");

            // 4. thuc thi truy van
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new StartupProjectsDTO(
                            rs.getInt("project_id"),
                            rs.getString("project_name"),
                            rs.getString("Description"),
                            rs.getString("Status"),
                            rs.getDate("estimated_launch")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 5. Kiem tra so luong ket qua
        //System.out.println("So luong ket qua tim thay: " + list.size());
        return list;
    }

    public boolean updateYearEqual2024(String id) {
        String sql = "UPDATE tblStartupProjects SET estimated_launch = '2022-01-01' where project_id = ?  ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

}
