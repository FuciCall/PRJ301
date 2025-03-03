
import dao.IDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.StartupProjectsDTO;
import utils.DBUtils;



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
        String sql = "SELECT * FROM tblStartupProjects where project_name like ?";
        List<StartupProjectsDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+searchTerm+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                StartupProjectsDTO sp = new StartupProjectsDTO(
                        rs.getInt("project_id"), 
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getDate("estimated_launch"));
            list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }



}