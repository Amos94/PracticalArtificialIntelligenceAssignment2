# Practical Artificial Intelligence Assignment 2

Rule-Based Programming (85)
Introduction
The University of Pris Wolog (UPW) offers a Mini-Master of Informatics, worth 30 ECTS.

Students who complete this master program get the title 'Mini-Master of Science', or 'MMSc', to show that they are capable of things without having to invest too much time or effort (after all, who would want to do a full master..). The teaching staff at UPW seems to have wanted to save time themselves as well, as they copied some basic structure of the University of Zürich’s Master of Informatics for their own Mini-Master program.

Since the teaching staff is so lazy, they need a program that will check for them if a student has completed all required aspects for graduation. In this assignment, you will write a logical program to do just that.

Graduation assignment
Programming language
This assignment has to be written in Swi Prolog, a logical programming language that allows you to write a set of sentences in logical form. You can download version 7.6.4 here. Tutorials and documentation can be found on their website. Of course, websites such as Stack Overflow will also be your best friends. The slides of Tutorial 3 (see  Materials) will also give you a first introduction to Prolog.

Do not forget that Prolog is case-sensitive, so all constants used should be in small letters (e.g. alice, not Alice), while all variables start with a capital (e.g. X). 

Assignment details
Students at UPW can be in two different tracks: Software Systems (ss) and Information Systems (is). UPW has three different faculties that offer courses: Informatics (inf), Economics (eco), and Law (law).

Graduation criteria SS students

30 ECTS in total
20 ECTS from inf courses
10 ECTS from eco courses
Graduation criteria IS students

30 ECTS in total
20 ECTS from inf courses
OR
5 ECTS from eco and 5 ECTS from law courses      
10 ECTS from eco courses
Courses offered per faculty

inf faculty	eco faculty	law faculty
Practical Artificial Intelligence (pai), 10 ECTS	Banking and Finance (bf), 5 ECTS	Democracy (d), 10 ECTS
Theoretical Artificial Intelligence (tai), 5 ECTS	Behavioral Economics (be), 5 ECTS	Financial Law (fl), 5 ECTS
Data Science (ds), 5 ECTS	Quantitative Finance (qf), 10 ECTS	Public Procedural Law (ppl), 2,5 ECTS
Communication Systems (cs), 5 ECTS	 	European Institutes (ei), 2,5 ECTS
Big Data Analytics (bda), 5 ECTS	 	 
Prolog Syntax Instruction
To be able to test your code using different students and courses, you must use the following syntax for declaring facts about students, courses and attendance:



Variables used in example:

S: student's first name (e.g. alice)
T: track (e.g. ss)
C: course abbreviation (e.g. pai)
F: faculty abbreviation (e.g. inf)
E: number of ECTS (e.g. 5)
 
Levels of implementation 
The assignment has different levels of increasing complexity, each level gives you a certain number of points (given between brackets after each level, summing to 85, the maximum you can get for the programming part of Assignment 2). The difficulty increases with each level for the first threelevels, and in some cases you can reuse code from earlier levels in the next level. You are therefore adviced to stick to the order of the levels (with the exception of Level 4). Your code will be tested by adding more students, courses and attendance to see if your code still works. 

Level 1 (15)

Info:

Students have a certain number of credits.
If they have more than 30 ECTS, they pass, if they have less than 30 ECTS, they fail.
For example, Alice has 30 ECTS and Bob has 10 ECTS. The program should output the number of credits a student has, and that Alice passes and Bob fails.

Note: this means you don't have to take courses followed, the track and faculties into account yet for a student to pass, i.e. for pass1(X) and fail1(X). The number of credits a student has, has_credits(X,E), will only be used in this level to be assumed to be known. 

Document input example: 



Implement the following functions for level 1:

pass1(X): this function should take a student as input, and output true if the student has 30 or more ECTS.
fail1(X): this function should take a student as input, and output true if the student has less than 30 ECTS.
Terminal input-output pairs examples:

Input

Output

pass1(alice).

true

pass1(bob).

false

pass1(X).

alice

fail1(alice).

false

fail(1)(bob).	
true

fail1(X).

bob

If the query contains a specific variable (e.g. the name alice for pass1(alice)), your code will be evaluated on it's truth, and output true or false. If you do not specify the variable in your query (e.g. pass1(X)), the program will return a possible solution to the query. To get all possible answers, repeatedly press space until the ?- sign reappears, indicating all possible options were listed and you can enter a new query. This hold for all levels, and will not be repeated in the input-output examples.

Level 2 (35)

Info:

Students have a certain track and attended certain courses.
Courses have a certain number of ECTS.
Each course has a certain number of ECTS. The number of credits is the sum of a list of courses.
If students have more than 30 ECTS, they pass, if they have less than 30 ECTS, they fail.
For example, Alice has followed pai, qf and d, and Bob has only followed pai. The program should output the number of ECTS a student has based on a course list, and that Alice passes and Bob fails.

Note: this means you don't have to take the track and faculties into account yet for a student to pass, i.e. for pass2(X) and fail2(X). You do have to take into account that a student can have followed multiple courses. Your pass2(X) and fail2(X) should be based on the number of credits retained from the student's course list and number of credits, and may not be hard-coded as has_credits(E).

Document input example:



Implement the following functions for level 2:

num_cred(X,Y): this function should take a list of course abbreviations as input (X), and output the number of credits obtained when a student attended these courses (Y).
courses(X,Y): this function should take a student as input (X), and output a list of all courses this student attended (Y).
pass2(X): this function should take a student as input, and output true if the student has 30 or more ECTS based on num_cred(X).
fail2(X): this function should take a student as input, and output true if the student has less than 30 ECTS based on num_cred(X).
Terminal input-output pairs examples:

Input

Output

num_cred([pai,qf,d],X).

30

courses(alice,X).

[pai,qf,d]

pass2(X).

alice

fail2(X).

bob

 

Level 3 (25)

Info:

Courses have a certain number of ECTS.
Each course has a certain number of ECTS. The number of ECTS a student has, is the sum of their course list.
Each track requires a number of ECTS from different faculties.
If students have more than 30 ECTS and more than the minimal number of ECTS required per faculty, they pass, else they fail.
For example, Alice, Bob and Carlos are all ss students. Alice followed pai, tai, bc and qf (enough ECTS in the right faculties). Bob followed pai, qf and d (enough ECTS but in the wrong faculties). Carlos did pai, tai and eb (not enough ECTS but in the right faculties). The program should output that Alice passes, and Bob and Carlos fail, based on which courses they followed in which track.

 Document input example:



Implement the following functions for level 3:

pass3(X): this function should take a student as input, and output true if the student has enough ECTS in each faculty based on their track.
fail3(X): this function should take a student as input, and output true if the student does not have enough ECTS in each faculty based on their track.
Input-output examples:

Input

Output

pass3(X).

alice

fail3(X).

bob

 

Level 4 (10)

Level 4 requires you to remove duplicates in two cases:

Case 1: In some cases, Prolog tends to find the same solution multiple times when pressing space after a query. Level 4 is like Level 3, only the output to a query (e.g. pass4(X)) should not contain any duplicates (i.e. when you press space to get all possible answers, students should only appear once in the possible answers).

Case 2: To make sure that students didn't by accident have the same course registered twice, make sure that for each student each course only counts as one course, not multiple (e.g. attend(bob, qf). attend(bob,qf). should not get bob 20 ECTS, but only 10).

Implement the following functions for level 4:

pass4(X): this function should take a student as input, and output true if the student has enough ECTS in each faculty based on their track, without duplicates in course and output.
fail4(X): this function should take a student as input, and output true if the student does has enough ECTS in each faculty based on their track, without duplicates in course and output.
 
