package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


public class ProjectValidator {
    private static final List<String> VALID_STATUSES = Arrays.asList("Ideation", "Development", "Launch", "Scaling");
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public static boolean isValidName(String name) {
        return name != null && !name.trim().isEmpty() && name.matches("^[a-zA-Z0-9 ]+$");
    }

    public static boolean isValidDescription(String description) {
        return description == null || description.matches("^[a-zA-Z0-9 ,.]*$");
    }

    public static boolean isValidStatus(String status) {
        return status != null && VALID_STATUSES.contains(status);
    }

    public static boolean isValidDate(String dateStr) {
        if (dateStr == null || !dateStr.matches("^\\d{4}-\\d{2}-\\d{2}$")) return false;
        try {
            Date date = DATE_FORMAT.parse(dateStr);
            return Integer.parseInt(new SimpleDateFormat("yyyy").format(date)) >= 2025;
        } catch (ParseException e) {
            return false;
        }
    }
}
