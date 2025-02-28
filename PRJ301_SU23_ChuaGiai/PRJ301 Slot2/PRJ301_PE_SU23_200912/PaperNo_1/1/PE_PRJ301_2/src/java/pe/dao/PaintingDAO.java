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
import java.util.ArrayList;
import java.util.List;
import pe.model.PaintingDTO;
import pe.utils.DBUtils;

/**
 *
 * @author as
 */
public class PaintingDAO extends DBUtils {

    public List<PaintingDTO> searchPainting(String txtSearch) throws SQLException {
        List<PaintingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [tblPainting] WHERE [description] like ? and [status] = 1";
        try {
            conn = getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + txtSearch + "%");
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("id");
                    String creator = rs.getString("creator");
                    String description = rs.getString("description");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    double price = rs.getDouble("price");
                    boolean status = rs.getBoolean("status");
                    PaintingDTO painting = new PaintingDTO(id, creator, description, height, width, price, status);
                    list.add(painting);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return list;
    }
}
