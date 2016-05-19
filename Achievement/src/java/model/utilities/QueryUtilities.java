package model.utilities;

public class QueryUtilities {

    public static String QueryByWord(String word) {
        return "SELECT achievements.id, achievements.achievement_name, achievements.achievement_type, achievements.date, \n"
                + "GROUP_CONCAT(DISTINCT organizations.organization_name) AS 'Organization', "
                + "GROUP_CONCAT(DISTINCT student.th_name) AS 'StudentName'\n"
                + "FROM achievements\n"
                + "JOIN organization_achievement\n"
                + "ON (achievements.id = organization_achievement.achievement_id)\n"
                + "JOIN organizations\n"
                + "ON (organization_achievement.organization_id = organizations.id)\n"
                + "JOIN student_achievement\n"
                + "ON (achievements.id = student_achievement.achievement_id)\n"
                + "JOIN student\n"
                + "ON (student_achievement.student_id = student.student_id)\n"
                + "WHERE achievements.achievement_name LIKE '%" + word + "%'\n"
                + "GROUP BY achievements.achievement_name";
    }

    public static String QueryByAchievementType(Integer achievement_id, Integer achievement_type) {
        switch (achievement_type) {
            case 1:
                // Competition
                return "SELECT achievements.id, achievements.achievement_name, competitions.event_name, achievements.date, achievements.category, competitions.topic, competitions.level, competitions.rank, achievements.reward,\n"
                        + "GROUP_CONCAT(DISTINCT organizations.organization_name) AS 'organization', GROUP_CONCAT(DISTINCT student.th_name) AS 'student_name',GROUP_CONCAT(DISTINCT student.student_id) AS 'student_id',GROUP_CONCAT(DISTINCT teacher.th_prename, teacher.th_name) AS 'teacher_name'\n"
                        + "FROM achievements\n"
                        + "JOIN organization_achievement\n"
                        + "ON (achievements.id = organization_achievement.achievement_id)\n"
                        + "JOIN organizations\n"
                        + "ON (organization_achievement.organization_id = organizations.id)\n"
                        + "JOIN teacher_achievement\n"
                        + "ON (achievements.id = teacher_achievement.achievement_id)\n"
                        + "JOIN teacher\n"
                        + "ON (teacher_achievement.teacher_id = teacher.teacher_id)\n"
                        + "JOIN student_achievement\n"
                        + "ON (achievements.id = student_achievement.achievement_id)\n"
                        + "JOIN student\n"
                        + "ON (student_achievement.student_id = student.student_id)\n"
                        + "JOIN competitions\n"
                        + "ON (achievements.id = competitions.achievement_id)\n"
                        + "WHERE achievements.id = " + achievement_id + "\n"
                        + "GROUP BY achievements.achievement_name";
            case 2:
                // Ambassador
                return "SELECT achievements.id, achievements.achievement_name, achievements.date, ambassadors.year,\n"
                        + "GROUP_CONCAT(DISTINCT organizations.organization_name) AS 'organization',\n"
                        + "GROUP_CONCAT(DISTINCT student.th_name) AS 'student_name',\n"
                        + "GROUP_CONCAT(DISTINCT student.student_id) AS 'student_id' \n"
                        + "FROM achievements\n"
                        + "JOIN organization_achievement\n"
                        + "ON (achievements.id = organization_achievement.achievement_id)\n"
                        + "JOIN organizations\n"
                        + "ON (organization_achievement.organization_id = organizations.id)\n"
                        + "JOIN student_achievement\n"
                        + "ON (achievements.id = student_achievement.achievement_id)\n"
                        + "JOIN student\n"
                        + "ON (student_achievement.student_id = student.student_id)\n"
                        + "JOIN ambassadors\n"
                        + "ON (achievements.id = ambassadors.achievement_id)\n"
                        + "WHERE achievements.id = " + achievement_id + "\n"
                        + "GROUP BY achievements.achievement_name";

            case 3:
                // Certificate
                return "SELECT achievements.id, achievements.achievement_name, achievements.date, certs.exp_date,\n"
                        + "GROUP_CONCAT(DISTINCT organizations.organization_name) AS 'organization',\n"
                        + "GROUP_CONCAT(DISTINCT student.th_name) AS 'student_name',\n"
                        + "GROUP_CONCAT(DISTINCT student.student_id) AS 'student_id' \n"
                        + "FROM achievements\n"
                        + "JOIN organization_achievement\n"
                        + "ON (achievements.id = organization_achievement.achievement_id)\n"
                        + "JOIN organizations\n"
                        + "ON (organization_achievement.organization_id = organizations.id)\n"
                        + "JOIN student_achievement\n"
                        + "ON (achievements.id = student_achievement.achievement_id)\n"
                        + "JOIN student\n"
                        + "ON (student_achievement.student_id = student.student_id)\n"
                        + "JOIN certs\n"
                        + "ON (achievements.id = certs.achievement_id)\n"
                        + "WHERE achievements.id = " + achievement_id + "\n"
                        + "GROUP BY achievements.achievement_name";
            default:
                return null;
        }
    }

}
