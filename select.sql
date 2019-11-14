# 1.Query the existence of 1 course
SELECT * FROM student_course WHERE courseId = 1;
# 2.Query the presence of both 1 and 2 courses
SELECT * FROM student_course t1 JOIN student_course t2 ON t1.studentId = t2.studentId WHERE t1.courseId = 1 AND t2.courseId = 2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT t1.id, t1.name, AVG(t2.score) FROM student t1 JOIN student_course t2 ON t1.id = t2.studnetId GROUP BY t1.id, t1.name HAVING AVG(score) >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT t1.* FROM student t1 JOIN student_course t2 ON t1.id = t2.studentId WHERE t2.studentId IS NULL;
# 5.Query all SQL with grades
SELECT * FROM student t1 JOIN student_course t2 ON t1.id = t2.studentId JOIN course t3 ON t2.courseId = t3.id JOIN teacher t4 ON t4.id = t3.teacherId;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT t1.* FROM student t1 JOIN student_course t2 ON t1.id = t2.studentId WHERE t1.id = 1 AND t2.courseId = 2;
# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT t1.id, t1.name, t2.courseId, t2.score FROM student t1 JOIN student_course t2 ON t1.id = t2.studentId WHERE t2.score < 60 ORDER BY t2.score DESC LIMIT 1;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT courseId, AVG(score) FROM student_course GROUP BY courseId ORDER BY AVG(score) DESC, courseId ASC;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT t1.name, t2.score FROM student t1 JOIN student_course t2 ON t1.id = t2.studentId JOIN course t3 ON t2.courseId = t3.id WHERE t3.name = 'Math' AND t2.score < 60;