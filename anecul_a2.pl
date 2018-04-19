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
fail1(X):- \+pass1(X).

has_credits(X,E):-student(X,K).

/*
Amos' tests
student(amos, ss).
student(sam, ss).
student(bob, ss).
student(rob, ss)

has_credits(amos, 30).
has_credits(sam, 10).
has_credits(alice, 200).
has_credits(bob, 30).
has_credits(rob, 29).
has_credits(ben, 100).
*/


/* Implementation of Level 2 */
