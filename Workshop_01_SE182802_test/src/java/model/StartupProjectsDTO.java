package model;

import java.util.Date;

public class StartupProjectsDTO {
    private int project_id;
    private String project_name;
    private String description;
    private String status;
    private Date estimated_launch; // Thay int -> Date

    public StartupProjectsDTO() {
    }

    public StartupProjectsDTO(int project_id, String project_name, String description, String status, Date estimated_launch) {
        this.project_id = project_id;
        this.project_name = project_name;
        this.description = description;
        this.status = status;
        this.estimated_launch = estimated_launch;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getEstimated_launch() {  // Đổi kiểu dữ liệu
        return estimated_launch;
    }

    public void setEstimated_launch(Date estimated_launch) {  // Đổi kiểu dữ liệu
        this.estimated_launch = estimated_launch;
    }

    @Override
    public String toString() {
        return "StartupProjectsDTO{" +
                "project_id=" + project_id +
                ", project_name='" + project_name + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", estimated_launch=" + estimated_launch +
                '}';
    }
}
