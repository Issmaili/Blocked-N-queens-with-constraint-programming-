int: N;
int: M;

array[1..N] of var 1..N: q;
array[1..M] of int: blocked_rows;
array[1..M] of int: blocked_cols;

include "alldifferent.mzn";

constraint
    all_different(q);

constraint
    forall(i in 1..N) (
        forall(j in i+1..N) (
            abs(q[i] - q[j]) != j - i
        )
    );

constraint
    forall(i in 1..M) (
        q[blocked_rows[i]] != blocked_cols[i]
    );

solve satisfy;