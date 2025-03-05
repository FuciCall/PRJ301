package dao;

import dto.ProjectDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class ProjectDAO implements IDAO<ProjectDTO, String> {

    @Override
    public boolean create(ProjectDTO entity) {
        // Cần thực hiện logic tạo mới ProjectDTO
        return false;
    }

    @Override
    public List<ProjectDTO> readAll() {
        return null;
    }

    @Override
    public ProjectDTO readById(String id) {
        return null;
    }

    @Override
    public boolean update(ProjectDTO entity) {
        // Cần thực hiện logic cập nhật ProjectDTO
        return false;
    }

    @Override
    public boolean delete(String id) {
        // Cần thực hiện logic xóa ProjectDTO
        return false;
    }

    @Override
    public List<ProjectDTO> search(String searchTerm) {
        return null;
    }
    
    public List<ProjectDTO> searchByTitle(String searchTerm) {
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ?";
        List<ProjectDTO> list = new ArrayList<>();
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProjectDTO project = new ProjectDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("estimated_launch"));
                
                list.add(project);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

    public List<ProjectDTO> searchByTitle2(String searchTerm) {
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ? AND project_id > 0";
        List<ProjectDTO> list = new ArrayList<>();
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProjectDTO project = new ProjectDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("estimated_launch"));
                
                list.add(project);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

    public boolean updateQuantityToZero(String id) {
        String sql = "UPDATE tblStartupProjects SET project_id = 0 WHERE project_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }
}