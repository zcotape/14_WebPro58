package controller;

import database.DatabaseConnection;
import guide.Guide;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import model.utilities.AchievementList;
import org.apache.poi.hssf.usermodel.HSSFFormulaEvaluator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "DownloadExcelServlet", urlPatterns = "/download.excel")
public class DownloadExcelServlet extends HttpServlet {

    List<AchievementList> achievementList = new ArrayList<AchievementList>();
    private static final int BYTES_DOWNLOAD = 1024000;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        //Blank workbook
        XSSFWorkbook workbook = new XSSFWorkbook();

        //Create a blank sheet
        XSSFSheet sheet = workbook.createSheet("Employee Data");

        try {
            String sqlCommand = "SELECT \n"
                    + "    GROUP_CONCAT(DISTINCT student.th_name) AS 'StudentName', \n"
                    + "    achievements.achievement_name, \n"
                    + "    achievements.category, \n"
                    + "    organizations.organization_name, \n"
                    + "    achievements.reward, \n"
                    + "    achievements.date\n"
                    + "\n"
                    + "    FROM achievements\n"
                    + "    JOIN student_achievement\n"
                    + "    ON (student_achievement.achievement_id = achievements.id)\n"
                    + "    JOIN student\n"
                    + "    ON (student.student_id = student_achievement.student_id)\n"
                    + "    JOIN organization_achievement\n"
                    + "    ON (organization_achievement.achievement_id = student_achievement.achievement_id)\n"
                    + "    JOIN organizations\n"
                    + "    ON (organizations.id = organization_achievement.organization_id)\n"
                    + "    GROUP BY achievements.achievement_name\n"
                    + "    ORDER BY achievements.date";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                AchievementList list = new AchievementList();
                list.setStudent_name(result.getString("StudentName"));
                list.setAchievement_name(result.getString("achievements.achievement_name"));
                list.setCategory(result.getString("achievements.category"));
                list.setOrganization_name(result.getString("organizations.organization_name"));
                list.setReward(result.getString("achievements.reward"));
                System.out.println(result.getString("achievements.date"));
                list.setDate(result.getString("achievements.date"));
                System.out.println(list.getDate());
                achievementList.add(list);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //This data needs to be written (Object[])
        Map<Integer, Object[]> data = new TreeMap<>();
        data.put(0, new Object[]{
            "นักศึกษา",
            "ชื่องาน",
            "ประเภท",
            "หน่วยงานจัด",
            "รางวัล/ประกาศ เกียรติคุณยกย่อง",
            "วันเดือนปีที่ได้รับ"});
        for (int i = 1; i <= achievementList.size(); i++) {
            data.put(i, new Object[]{
                achievementList.get(i-1).getStudent_name(),
                achievementList.get(i-1).getAchievement_name(),
                achievementList.get(i-1).getCategory(),
                achievementList.get(i-1).getOrganization_name(),
                achievementList.get(i-1).getReward(),
                achievementList.get(i-1).getDate()});
        }
        //Iterate over data and write to sheet
        Set<Integer> keyset = data.keySet();
        int rownum = 0;

        for (Integer key : keyset) {
            Row row = sheet.createRow(rownum++);
            Object[] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr) {
                Cell cell = (Cell) row.createCell(cellnum++);
                if (obj instanceof String) {
                    cell.setCellValue((String) obj);
                } else if (obj instanceof Integer) {
                    cell.setCellValue((Integer) obj);
                }
            }
        }
        // Set Column Size to Auto
        HSSFFormulaEvaluator.evaluateAllFormulaCells(workbook);
        for (int i = 0; i < 6; i++) {
            sheet.autoSizeColumn(i);
        }
        String file_path = getServletContext().getRealPath("/documents") + File.separator + "achievement_report_" + request.getSession().getId() + ".xlsx";
        try {
            //Write the workbook in file system
            FileOutputStream out = new FileOutputStream(new File(file_path));
            workbook.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(Guide.getRoute(request, "documents/achievement_report_" + request.getSession().getId() + ".xlsx"));
    }
}
