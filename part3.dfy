/*
  Part 3: Loop invariants

  The last part consists of 4 loop invariant problems.

  This part is written in a "design by contract" style:
  we will give you the pre/postconditions
  for several methods. Your job is to implement the
  method so that the verification passes.

  ===== Grading notes =====

  - Every method that you implement should have a `while` loop!
    If you find a way to do it without a loop, you may explain
    it in a comment, but please implement it with a loop.

  - Your file should pass the Dafny verifier with no errors or warnings.
    Look for the green bars on the left or
    (if you have the command line): `dafny verify part3.dfy` should output
    ```
    Dafny program verifier finished with <n> verified, 0 errors
    ```

  - Don't change the method signatures or pre/postconditions
    for any of the methods.
    However, you can add helper methods if needed.

  - Since the specs are already written, the only requirement
    is that you implement the methods so that the specs pass.
*/

/*
  1. Integer square root

  This function should find the integer square root of a number:
  the largest integer whose square is less than or equal to n.
  For example, IntSqrt(3) == 1, IntSqrt(4) == 2, IntSqrt(5) == 2.
*/

method IntSqrt(n: int) returns (root: int)
  requires n >= 0
  ensures root * root <= n < (root + 1) * (root + 1)
  // TODO: delete the following line and implement the function
  requires false
{
  // TODO
}

/*
  2. Number of digits function

  Calculates the number of digits of a number (in base 10).

  For example, NumDigits(123) == 3, NumDigits(1) == 1.
*/

// This function is used in the postcondition
function pow(base: int, exponent: nat): int
{
  if exponent == 0 then 1 else base * pow(base, exponent - 1)
}

method NumDigits(n: int) returns (digits: int)
  requires n >= 1
  ensures digits >= 1
  ensures pow(10, digits - 1) <= n < pow(10, digits)
  // TODO: delete the following line and implement the function
  requires false
{
  // TODO
}

/*
  3. List copy

  Copy a list (sequence) into a new sequence.
  For example, if the input list is
    [1, 2, 3]
  the output list would also be
    [1, 2, 3].
*/

method CopySequence(a: seq<int>) returns (b: seq<int>)
  ensures |b| == |a|
  ensures forall i :: 0 <= i < |a| ==> a[i] == b[i]
  // TODO: delete the following line and implement the function
  requires false
{
  // TODO
}

/*
  4. List partial sum

  Compute the partial sums of a list. For example, if the
  input list is
    [1, 2, 3]
  the output list would be
    [0, 1, 3, 6].

  Note: It doesn't sound tricky, but this one is hard!
  You may need to use a lemma to get the verification to pass.

  We have provided a space for a helper lemma below and
  a brief explanation of how lemmas work.

  ===== What are lemmas? =====

  A lemma is written as a method that provides
  an additional postcondition. A lemma may or may not have a body.
  If it does have a body, usually that would consist of some
  additional assertions that help prove the lemma.
  You can write one like this:

  method Lemma(a: seq<int>)
    ensures <some conditions>
  {
  }

  To call the lemma, you just call the method.
  It brings the postcondition assert in scope so that Dafny
  can use it to verify the code in the location you're working on.

    // Call the lemma to bring its postcondition into scope
    Lemma();
    // Prove some additional assertions that the lemma is helpful for
    assert <some hard condition>;

*/

// This function is needed to state the postcond for PartialSums
function array_sum(a: seq<int>): int
{
  if |a| == 0 then 0 else (a[|a| - 1] + array_sum(a[..(|a| - 1)]))
}

// Space for lemmas
// (You may rename or remove the lemmas)
lemma Lemma1(a: seq<int>)
{
  // Fill in here
}
lemma Lemma2(a: seq<int>)
{
  // Fill in here
}

method PartialSums(a: seq<int>) returns (b: seq<int>)
  ensures |b| == |a| + 1
  ensures forall i :: 0 <= i <= |a| ==> b[i] == array_sum(a[..i])
  // TODO: delete the following line and implement the function
  requires false
{
  // TODO
}

/*
  5. Uncomment the following Main function to make sure that
  your implementations above are working.
  If it passes the verifier (green bar), you're done!

  Note: The main point of this part is to make sure that you have
  removed the `requires false` lines and implemented the methods
  so that calling the tests actually works.

  If you have the Dafny command line, you can also run the
  function with `dafny run part3.dfy`.

  There are a few assertions, but since we've already proven
  the code correct, we don't need to test the code exhaustively.
  You don't need to add any other assertions or tests.
*/

// method Main()
// {
//   var x1 := IntSqrt(3);
//   var x2 := IntSqrt(4);
//   var x3 := IntSqrt(5);
//   assert x1 == 1;
//   assert x2 == 2;
//   assert x3 == 2;
//   print "x1 = ", x1, ", x2 = ", x2, ", x3 = ", x3, "\n";

//   var y := NumDigits(12);
//   assert y == 2;
//   print "y = ", y, "\n";

//   var a1 := [1, 2, 3];
//   var b1 := CopySequence(a1);
//   assert a1 == b1;
//   print "b1 = ", b1, "\n";

//   var a2 := [1, 2, 3];
//   var b2 := PartialSums(a2);
//   print "b2 = ", b2, "\n";
// }

/*
  6. Short answer

  Which of the above loop invariants did you find hardest to solve?
  Which was the easiest?
  Comment on why this might be the case.

  ===== ANSWER Q6 BELOW =====

  ===== END OF Q6 ANSWER =====
*/
