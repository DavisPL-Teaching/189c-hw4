/*
  Part 3: Loop invariants

  The last part consists of 5 loop invariant problems.

  This part is written in a "design by contract" style:
  we will give you the pre/postconditions
  for several methods. Your job is to implement the
  method so that the verification passes.

  Requirements:
  - Every method that you implement should have a `while` loop!
    If you find a way to do it without a loop, you may explain
    it in a comment, but please implement it with a loop.

  - Don't change the method signatures or pre/postconditions
    for any of the methods!
    You can always add helper methods if needed.

  - Since the specs are already written, the only requirement
    is that you implement the methods so that the specs pass.

  - Your file should pass the Dafny verifier with no errors or warnings.
    Look for the green bars or (if you have the command line):
    ```
    Dafny program verifier finished with <n> verified, 0 errors
    ```
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
  Check out the hints.md file if you get stuck!

  ===== What are lemmas? =====

  A lemma is written as a method that provides
  an additional postcondition. A lemma may or may not have a body.
  You can write one like this:

  method Lemma(a: seq<int>)
    ensures <some conditions>
  {
  }

  To call the lemma, you just call the method.
  It brings the postcondition assert in scope so that Dafny
  can use it to verify the code in the location you're working on.

    // Call the lemma
    Lemma();
    // Prove some additional assertions that were failing using the lemma
    assert <some hard condition>;

*/

// This function is needed to state the pre/postconditions
function array_sum(a: seq<int>): int
{
  if |a| == 0 then 0 else (a[|a| - 1] + array_sum(a[..(|a| - 1)]))
}

// Space for lemmas
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
  5. Uncomment the following tests to make sure that
  your implementations above are working.

  Note: since we've already proven the code correct,
  using tests is not strictly necessary. You could argue
  it's redundant.
  The main point of this part is to make sure that you have
  removed the `requires false` lines and implemented the methods
  so that calling the tests actually works.
*/

method Tests()
{
  // var x1 := IntSqrt(3);
  // var x2 := IntSqrt(4);
  // var x3 := IntSqrt(5);
  // assert x1 == 1;
  // assert x2 == 2;
  // assert x3 == 2;

  // var y1 := NumDigits(123);
  // var y2 := NumDigits(1);
  // assert y1 == 3;
  // assert y2 == 1;

  // var a1 := [1, 2, 3];
  // var b1 := CopySequence(a1);
  // assert a1 == b1;

  // var a2 := [1, 2, 3];
  // var b2 := PartialSums(a2);
  // assert b2 == [0, 1, 3, 6];
}
