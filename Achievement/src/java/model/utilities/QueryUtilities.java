package model.utilities;

public class QueryUtilities {
    
    public static String QueryByWord(String word) {
        return "SELECT achievements.achievement_name, achievements.date, \n" +
"     GROUP_CONCAT(DISTINCT organizations.organization_name) AS 'Organization', "
                + "GROUP_CONCAT(DISTINCT student.th_name) AS 'StudentName'\n" +
"    FROM achievements\n" +
"    JOIN organization_achievement\n" +
"    ON (achievements.id = organization_achievement.achievement_id)\n" +
"    JOIN organizations\n" +
"    ON (organization_achievement.organization_id = organizations.id)\n" +
"    JOIN student_achievement\n" +
"    ON (achievements.id = student_achievement.achievement_id)\n" +
"    JOIN student\n" +
"    ON (student_achievement.student_id = student.student_id)\n" +
"    WHERE achievements.achievement_name LIKE '%" + word + "%'\n" +
"    GROUP BY achievements.achievement_name";
    }
    
}
