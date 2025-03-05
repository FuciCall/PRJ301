package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import dto.StartupProjectsDTO;
import java.sql.Date;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author as
 */
public class StartupProjectsDAO implements IDAO<StartupProjectsDTO, String> {

    @Override
    public boolean create(StartupProjectsDTO entity) {
        String sql = "INSERT INTO tblStartupProjects "
                + " (project_id, project_name, Description, Status, estimated_launch) "
                + " VALUES (?, ?, ?, ?, ?) ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getProject_id());
            ps.setString(2, entity.getProject_name());
            ps.setString(3, entity.getDescription());
            ps.setString(4, entity.getStatus());
            ps.setDate(5, (Date) entity.getEstimated_launch());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    @Override
    public List<StartupProjectsDTO> readAll() {
        return null;
    }

    @Override
    public StartupProjectsDTO readById(String id) {
        StartupProjectsDTO project = null;
        String query = "SELECT * FROM tblStartupProjects WHERE project_id = ?";

        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, id);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                project = new StartupProjectsDTO(
                        result.getInt("project_id"),
                        result.getString("project_name"),
                        result.getString("Description"),
                        result.getString("Status"),
                        result.getDate("estimated_launch")
                );
            }
        } catch (Exception exception) {
            System.out.println(exception.getMessage());
        }

        return project;
    }

    @Override
    public boolean update(StartupProjectsDTO entity) {
        String sql = "UPDATE [dbo].[tblStartupProjects] "
                + "SET Status = ? "
                + "WHERE project_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, entity.getStatus());
            ps.setInt(2, entity.getProject_id());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có dòng được cập nhật
        } catch (Exception e) {
            System.out.println("Error in update: " + e.toString());
        }
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
        List<StartupProjectsDTO> list = new ArrayList<StartupProjectsDTO>();

        // 2. Kiem tra ket noi database
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StartupProjectsDTO s = new StartupProjectsDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("estimated_launch"));

                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

    public List<StartupProjectsDTO> searchByName2(String searchTerm) {
        // 1. Kiem tra xem danh sach co du lieu khong
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ? AND (YEAR(estimated_launch)) = 2025";
        List<StartupProjectsDTO> list = new ArrayList<>();

        // 2. Kiem tra ket noi database
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StartupProjectsDTO s = new StartupProjectsDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("estimated_launch"));

                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

    public boolean updateYearLessThan2025(String id) {
        String sql = "UPDATE tblStartupProjects SET estimated_launch = '2024-01-01' where project_id = ?  ";
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
    
    public int getNextProjectId() throws ClassNotFoundException {
        String sql = "SELECT MAX(project_id) FROM tblStartupProjects";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }


}
