/*
888     888 8888888888P 888    888
888     888       d88P  888    888
888     888      d88P   888    888
888     888     d88P    8888888888
888     888    d88P     888    888
888     888   d88P      888    888
Y88b. .d88P  d88P       888    888
 "Y88888P"  d8888888888 888    888
*/

/* Add fact that someone is a student in a certain track */
student(S,T).

/* Add fact that a course belongs to a faculty, and has certain number of ECTS. */
course(C,F,E).

/*Add fact that a student has attended a course. */
attend(S,C).

/*
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

Input             Output

pass1(alice).     true

pass1(bob).       false

pass1(X).         alice

fail1(alice).     false
fail(1)(bob).     true

fail1(X).         bob

If the query contains a specific variable (e.g. the name alice for pass1(alice)), your code will be evaluated on it's truth, and output true or false. If you do not specify the variable in your query (e.g. pass1(X)), the program will return a possible solution to the query. To get all possible answers, repeatedly press space until the ?- sign reappears, indicating all possible options were listed and you can enter a new query. This hold for all levels, and will not be repeated in the input-output examples.
*/

/* Implementation of Level 1 */

pass1(X):- student(X,K), has_credits(X,E), E @>= 30.
fail1(X):- \+pass1(X).

has_credits(X,E):-student(X,K).

/*
Amos' tests
student(amos,ss).
student(sam,ss).
student(bob,ss).
student(rob,ss)

has_credits(amos,30).
has_credits(sam,10).
has_credits(alice,200).
has_credits(bob,30).
has_credits(rob,29).
has_credits(ben,100).
*/


/*
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

Input                       Output

num_cred([pai,qf,d],X).     30

courses(alice,X).           [pai,qf,d]

pass2(X).                   alice

fail2(X).                   bob
*/

/* Implementation of Level 2 */
num_cred([], 0).
num_cred([H|T], Sum) :- num_cred(T, Rest), Sum is H + Rest.
courses(X,Y).
pass2(X).
fail2(X).

/*Level 2 tests*/

course(pai,inf,10).
course(qf,eco,10).
course(d,law,10).

student(alice,ss).
attend(alice,pai).
attend(alice,qf).
attend(alice,d).

student(bob,ss).
attend(bob,pai).


/*
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

Input           Output

pass3(X).       alice

fail3(X).       bob
*/

/* Implementation of Level 3 */

pass3(X).
fail3(X).

/*Level 3 tests*/

course(pai,inf,10).
course(tai,inf,5).
course(cs,inf,5).
course(qf,eco,10).
course(be,eco,5).
course(d,law,10).

student(alice,ss).
attend(alice,pai).
attend(alice,tai).
attend(alice,cs).
attend(alice,qf).

student(bob,ss).
attend(bob,pai).
attend(bob,qf).
attend(bob,d).

student(carlos,ss).
attend(carlos,pai).
attend(carlos,tai).
attend(carlos,be).


/*Level 4 (10)

Level 4 requires you to remove duplicates in two cases:

Case 1: In some cases, Prolog tends to find the same solution multiple times when pressing space after a query. Level 4 is like Level 3, only the output to a query (e.g. pass4(X)) should not contain any duplicates (i.e. when you press space to get all possible answers, students should only appear once in the possible answers).

Case 2: To make sure that students didn't by accident have the same course registered twice, make sure that for each student each course only counts as one course, not multiple (e.g. attend(bob, qf). attend(bob,qf). should not get bob 20 ECTS, but only 10).

Implement the following functions for level 4:

    pass4(X): this function should take a student as input, and output true if the student has enough ECTS in each faculty based on their track, without duplicates in course and output.
    fail4(X): this function should take a student as input, and output true if the student does has enough ECTS in each faculty based on their track, without duplicates in course and output.
*/

/* Implementation of Level 4 */

pass4(X).
fail4(X).
