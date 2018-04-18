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
course(C, F, E).

/*Add fact that a student has attended a course. */
attend(S, C).

/* Implementation of Level 1 */

pass1(X):- student(X, K), has_credits(X,E), E @>= 30.
fail1(X):- student(X, K), has_credits(X,E), E @< 30.

has_credits(X,E).

/* Amos tests:
-------------------------
student(amos, ss).
student(sam, ss).
student(bob, ss).
student(alice, ifi).
has_credits(amos, 30).
has_credits(sam, 10).
has_credits(alice, 200).
-------------------------
*/


/* Implementation of Level 2 */
