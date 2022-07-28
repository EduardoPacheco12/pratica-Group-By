--Questão 1

SELECT COUNT("endDate") as "currentExperiences" 
FROM experiences

--Questão 2

SELECT "userId" as id, COUNT("userId") as educations 
FROM educations 
GROUP BY "userId" 
ORDER BY "userId" ASC

--Questão 3

SELECT users.name as writer, COUNT(testimonials.message) as "testimonailCount" 
FROM testimonials 
JOIN users
ON testimonials."writerId" = users.id
WHERE testimonials."writerId" = 435
GROUP BY users.name

--Questão 4

SELECT MAX(salary) as "maximumSalary", roles.name as role 
FROM jobs
JOIN roles
ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY role
ORDER BY role ASC

--Questão bônus

SELECT schools.name as school, courses.name as course, COUNT(educations.id) as "studentsCount", educations.status as role 
FROM educations
JOIN courses
ON educations."courseId" = courses.id
JOIN schools
ON educations."schoolId" = schools.id
WHERE educations.status = 'finished' OR educations.status = 'ongoing'
GROUP BY course, school, status
ORDER BY "studentsCount" DESC
LIMIT 3