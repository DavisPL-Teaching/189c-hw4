/*
  Part 1: Mini exercises

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
  only the assertion line (but leave the Test method there), and add a
  comment such as
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
  8. Use the Dafny "show counterexample" feature to find a counterexample
  to all the properties that are not true:

  - Uncomment all the assertions that are not true
  - Right click, Dafny --> "Show counterexample (experimental)"
  - Right click, Dafny --> "Copy counterexamples to clipboard"
  - Right click, Dafny --> "Hide counterexamples (experimental)"
  - Comment out the assertions again

  Paste the output below.
  It should copy the counterexamples for all properties at once.
  You can delete the "At file:///" clutter to leave only the counterexamples themselves.

  Note: This is an experimental feature, so it doesn't always work
  perfectly, but it is good to know about and can be useful for debugging.

  Make sure to comment out the assertions again above
  after you are done!

  ###### Answer Q8 ######

  ###### End of Answer ######
*/

/*
  B. Weakest preconditions
*/

/*
  B. Abstraction and interfaces

  This problem explores the concept of abstraction and interfaces
  through a binary search program.

  Many times in programming, there are multiple ways to implement
  a procedure or data structure -- as long as it satisfies the
  *interface* that we are expecting (pre and post conditions),
  it doesn't matter what the implementation of the procedure is.

  We begin with a between(a, b) function that should return
  a value between a and b.

  9. The between function requires a precondition in order to
  implement it. Implement the precondition to between
  in the function between_precond.
  Your precondition should be the weakest possible precondition
  (the weakest possible condition on a and b) that makes it possible
  to implement the following function in Q9.
*/

function between_precond(a: int, b: int): bool
{
  // TODO: replace with weakest possible precondition
  false
}

/*
  10. Implement the "between" method in three different ways.

  Make sure you don't modify the method signature
  or pre/postconditions for any of the versions.

  There is no other requirement other than that all three methods
  should be different from each other.
*/

method between_v1(a: int, b: int) returns (result: int)
  requires between_precond(a, b)
  ensures a < result && result < b
{
  // TODO
}

method between_v2(a: int, b: int) returns (result: int)
  requires between_precond(a, b)
  ensures a < result && result < b
{
  // TODO
}

method between_v3(a: int, b: int) returns (result: int)
  requires between_precond(a, b)
  ensures a < result && result < b
{
  // TODO
}

/*
  11. Use your between method to implement
  and prove a binary search algorithm.

  Requirements:

  - This binary search algorithm takes as input
    a function on integers, f, which is assumed
    to be monotonically increasing:
      for all x, y: int :: x < y ==> f(x) <= f(y)

  - The binary search algorithm should return
    the smallest value x such that
      f(x) >= target.
    The postcondition is written so that you will
    need to prove this!

  - Don't modify the method signature or
    pre/postconditions to binary_search.

  - Your method should call between_v1, between_v2,
    or between_v3 at least once.
*/

method binary_search(
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
  // Remove the following line to implement
  requires false
{
  // TODO
}

/*
  12. Uncomment the following tests to check whether your
  implementation of binary_search is working as expected.
*/

function double(x: int): int
{
  x * 2
}

// TODO: Uncomment
// method TestBinarySearch1()
// {
//   var result1 := binary_search(double, 0, 10, 4);
//   var result2 := binary_search(double, 0, 10, 5);
//   var result3 := binary_search(double, 0, 10, 20);
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
//   var result1 := binary_search(square, 0, 10, 10);
//   var result2 := binary_search(square, 0, 10, 16);
//   var result3 := binary_search(square, 0, 10, 100);
//   assert result1 == 4;
//   assert result2 == 4;
//   assert result3 == 10;
// }

/*
  13. Try replacing between_v1, between_v2, or between_v3 in
  the implementation of binary_search. What happens?

  ###### Answer Q13 ######

  ###### End of Answer ######

  14. Are there advantages of leaving the interface (pre/postconditions)
  for between abstract, so that multiple implementations are possible?

  Which of your between functions would be the most efficient to use
  in a real binary search implementation?

  ###### Answer Q14 ######

  ###### End of Answer ######
*/

/*
  C. Strongest postconditions and weakest preconditions

  Recall that on HW1 you were asked to write specs that
  "should completely describe the behavior of the function
  on all possible inputs."
  The underlying concept is that of *strongest postconditions*
  and (in the opposite direction), *weakest preconditions*.

  Use the methods we discussed in class to find the strongest
  postcondition and weakest precondition for each statement by adding
  an assert() statement after every line of code in the function.

  15. split_in_half
  (strongest postcondition)

  16. pad_with_spaces
  (weakest precondition)
*/

method SplitInHalf(s: string) returns (result1: string, result2: string)
  requires true
  // ensures ... // fill in after finding the strongest postcondition
{
  var mid := (|s| + 1) / 2;
  result1 := s[..mid];
  result2 := s[mid..];
}

method PadWithSpaces(s: string, n: int) returns (result: string)
  requires false // remove this line to work on this part!
  // requires ... // fill in after finding the weakest precondition
  ensures |result| == n
  ensures n >= |s|
  ensures result[..|s|] == s
{
  var prefix := s;
  var padding := seq(n - |s|, i => ' ');
  result := prefix + padding;
}

/*
  17. What precondition fell out of the weakest precondition calculation?
  Compare with the implementation we saw in Python:

  def pad_with_spaces(s, n):
      if len(s) > n:
          return None
      return s + " " * (n - len(s))

  Do you see advantages to this version of the function above in Dafny?

  ###### Answer Q17 ######

  ###### End of Answer ######
*/
