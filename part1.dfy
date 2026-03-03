/*
  Part 1: Mini exercises

  ===== Grading notes =====

  - Your file should pass the Dafny verifier with no errors or warnings.
    Look for the green bars on the left or
    (if you have the command line): `dafny verify part1.dfy` should output
    ```
    Dafny program verifier finished with <n> verified, 0 errors
    ```

  - Don't change the names of any methods or functions,
    or signatures unless you are asked to do so.

  - For places marked TODO, make sure these are filled in
    with code.

  - Remove `requires false` from any preconditions
    (`requires false` is one way to indicate an unimplemented method,
    like `raise NotImplementedError` in Python.)
*/

/*
  A. Writing specifications

  Consider the following function:
*/

function max(x: int, y: int): int
{
  if x > y then x else y
}

/*
  Write specifications for the following properties of max using Dafny.
  For each property, you should fill in the Test method
  with an assertion that demonstrates the property.
  If the test does not pass (Dafny doesn't show a green line), comment out
  only the assertion line (but leave the Test method there), and add the
  following comment:
    // Not true
  above the assertion to indicate that it is false.

  1. The maximum of a number with itself is the same number.
  2. The maximum of x and y is the same as the maximum of y and x.
  3. Addition distributes over max:
     max(x, y) + z is the same as max(x + z, y + z).
  4. Multiplication distributes over max:
     max(x, y) * z is the same as max(x * z, y * z).
  5. Max distributes over addition:
     max(x, y + z) is equal to the sum of max(x, y) and max(x, z).
  6. The maximum of x and -x is always equal to the absolute value of x.
     You will need to define the abs function for this property.
  7. If x is positive (greater than zero), then max(x, y) is also positive.
     To test this property, use a precondition on TestMax7 instead
     of just a plain assertion.
*/

method TestMax1(x: int)
{
  assert max(x, x) == x;
}

method TestMax2(x: int, y: int)
{
  // TODO
}

method TestMax3(x: int, y: int, z: int)
{
  // TODO
}

method TestMax4(x: int, y: int, z: int)
{
  // TODO
}

method TestMax5(x: int, y: int, z: int)
{
  // TODO
}

method TestMax6(x: int)
{
  // TODO
}

method TestMax7(x : int, y: int)
  // requires ...
{
  // TODO
}

/*
  8. Dafny has an experimental "show verification trace" feature
  that is intended to find a counterexample for a property that isn't true.
  This part will ask you to try out this feature!

  Unfortunately the tool has not always worked reliably in the past,
  but there has been some nice progress on it by the Dafny team recently.

  Try out the feature by doing the following:

  - Temporarily uncomment one of the assertions that is not true
  - Right click, Dafny --> "Show verification trace (experimental)"
  - If this doesn't work, you can also try pressing F7, which should
    turn on the feature.

  It should show you some outputs interactively in VSCode.
  - Comment out the assertion again, and right click, Dafny --> "Hide verification trace (experimental)" to disable the feature again.

  Paste any output you got below and describe what happened.
  Did Dafny give a genuine counterexample? Did it crash or raise an error?

  Comment on why it might be hard to generate counterexamples in Dafny.
  (Please answer more generally, not just for this example.)

  ===== ANSWER Q8 BELOW =====

  ===== END OF Q8 ANSWER =====
*/

/*
  B. Weakest preconditions

  Recall that a full functional correctness spec is one that
  "should completely describe the behavior of the function
  on all possible inputs."
  The underlying concept is that of *strongest postconditions*
  and (in the opposite direction), *weakest preconditions*.

  The following methods are given to you.
  For each method, find the weakest precondition.
  Replace the precondition `requires false` when you have
  written the precondition.

  9. SplitInHalf

  10. PadWithSpaces

  If you have the right precondition, Dafny should automatically accept
  the method. Without the precondition, the verification should fail.
*/

method SplitInHalf(s: string) returns (result1: string, result2: string)
  // Precondition: TODO: replace this line
  requires false
  // Postconditions:
  // - the two halves concatenate to s
  // - the two halves have the same length
  ensures result1 + result2 == s
  ensures |result1| == |result2|
{
  var mid := |s| / 2;
  result1 := s[..mid];
  result2 := s[mid..];
}

method PadWithSpaces(s: string, n: int) returns (result: string)
  // Precondition: TODO: replace this line
  requires false
  // Postconditions:
  // - the length of the result is n
  // - the first part is s
  // - the second part is padding
  ensures |result| == n
  ensures result[..|s|] == s
  ensures result[|s|..] == seq(n - |s|, i => ' ')
{
  var prefix := s;
  var padding := seq(n - |s|, i => ' ');
  result := prefix + padding;
}

/*
  11. Write and prove a unit test for PadWithSpaces
  to make sure that the pre and postconditions are working as expected.

  You can pick any example you want, as long as you have removed "requires false"
  and pick a valid example, Dafny should be able to prove the test.
*/

method TestPadWithSpaces()
{
  // TODO
}

/*
  12. Now also write and prove a similar unit test for SplitInHalf.

  Additional requirement:
  You can use any example except don't use s == "", as that one is too easy.

  This one is trickier!
  You may need to add an additional assertion in the middle
  for it to work. (You can think of this like an
  intermediate hint to help Dafny prove the final result.)
  Modify your test to get Dafny to prove it successfully.
*/

method TestSplitInHalf()
{
  // TODO
}

/*
  C. Binary search

  This part will explore the concept of abstraction and interfaces
  through implementing a verified binary search algorithm.

  Many times in programming, there are multiple ways to implement
  a procedure or data structure -- as long as it satisfies the
  *interface* that we are expecting (pre and post conditions),
  it doesn't matter what the implementation of the procedure is.

  We begin with the method:
    Between(a, b)
  which should simply return an integer strictly between a and b, that is:
    a < result < b.

  (The point of this method is that when doing a binary search,
  sometimes we need to pick a "pivot point" that is strictly between
  two bounds. This method will help us do that.)

  13. The between method requires a precondition in order to implement it!
  Write exactly the required precondition below.

  Your precondition should be the weakest possible precondition
  (the weakest possible condition on a and b) that makes it possible
  to implement Between_v1 below.
*/

function between_precond(a: int, b: int): bool
{
  // TODO: replace with weakest possible precondition
  false
}

/*
  14. Implement the "Between" method in three different ways.

  Don't modify the method signature
  or pre/postconditions for any of the versions.

  There is no other requirement other than that all three methods
  should be different from each other.
*/

method Between_v1(a: int, b: int) returns (result: int)
  requires between_precond(a, b)
  ensures a < result && result < b
{
  // TODO
}

method Between_v2(a: int, b: int) returns (result: int)
  requires between_precond(a, b)
  ensures a < result && result < b
{
  // TODO
}

method Between_v3(a: int, b: int) returns (result: int)
  requires between_precond(a, b)
  ensures a < result && result < b
{
  // TODO
}

/*
  15. Use your between method to implement
  and prove a binary search algorithm.

  Requirements:

  - This binary search algorithm takes as input
    a function on integers, f, which is assumed
    to be monotonically increasing:
      for all x, y: int :: x <= y ==> f(x) <= f(y)

  - The binary search algorithm should return
    the smallest value x such that
      f(x) >= target.
    The postcondition is written so that you will
    need to prove this!

  - Don't modify the method signature or
    pre/postconditions to BinarySearch.

  - Your method should call Between_v1 at least once.
*/

method BinarySearch(
  f: int -> int,
  min_val: int,
  max_val: int,
  target: int
) returns (result: int)
  // Precondition: `f` is monotonically increasing and passes
  // `target` somewhere between `min_val` and `max_val`
  requires forall x, y :: min_val <= x <= y <= max_val ==> f(x) <= f(y)
  requires min_val < max_val
  requires f(min_val) < target
  requires f(max_val) >= target
  // Postcondition: result is the smallest x such that f(x) >= target
  ensures f(result) >= target
  ensures f(result - 1) < target
  ensures min_val < result <= max_val
  // TODO: Remove the following line to implement
  requires false
{
  // TODO
}

/*
  16. Uncomment the following tests to check whether your
  implementation of BinarySearch is working as expected.
*/

function double(x: int): int
{
  x * 2
}

// TODO: Uncomment
// method TestBinarySearch1()
// {
//   var result1 := BinarySearch(double, 0, 10, 4);
//   var result2 := BinarySearch(double, 0, 10, 5);
//   var result3 := BinarySearch(double, 0, 10, 20);
//   assert result1 == 2;
//   assert result2 == 3;
//   assert result3 == 10;
// }

function square(x: int): int
{
  x * x
}

// TODO: Uncomment
// method TestBinarySearch2()
// {
//   var result1 := BinarySearch(square, 0, 10, 10);
//   var result2 := BinarySearch(square, 0, 10, 16);
//   var result3 := BinarySearch(square, 0, 10, 100);
//   assert result1 == 4;
//   assert result2 == 4;
//   assert result3 == 10;
// }

/*
  17. Try replacing Between_v1 with Between_v2 or Between_v3 in
  the implementation of BinarySearch. What happens?

  ===== ANSWER Q17 BELOW =====

  ===== END OF Q17 ANSWER =====

  18. Are there any advantages to leaving the interface (pre/postconditions)
  for Between abstract, so that multiple implementations are possible?

  Which of your Between functions would be the most efficient to use
  in a real binary search implementation?

  ===== ANSWER Q18 BELOW =====

  ===== END OF Q18 ANSWER =====
*/
