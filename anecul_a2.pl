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
has_credits(X,E).
