/*
  Part 2: Design by Contract

  In this part, we will give you the pre/postconditions
  for several methods. Your job is to implement the
  function so that the verification passes.

  Requirements:
  - Since the specs are already written, the only requirement
    is that you implement the methods so that the specs pass.

  - Don't change the function signatures or pre/postconditions
    for any of the methods. You can add helper functions if needed.

  - You will need to use loop invariants for 1 and 2.

  - Your code should pass the Dafny verifier:
      dafny verify part2.dfy
    should pass with no errors or warnings.

    You can also simply check that the green bar shows up next
    to every function in VSCode, throughout the whole file,
    with no errors (shown in red).
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
  3. Function to increment a stopwatch

  The last function assumes that we have a stopwatch that
  stores the time as a number of seconds, minutes, hours, and days.

  The function AdvanceStopwatch increments the stopwatch by a given
  number of seconds, and returns the new values.
*/

function calc_seconds(
  seconds: int, minutes: int, hours: int, days: int
): int
{
  86400 * days + 3600 * hours + 60 * minutes + seconds
}

function stopwatch_invariant(
  seconds: int, minutes: int, hours: int, days: int
): bool
{
  0 <= seconds < 60 && 0 <= minutes < 60 && 0 <= hours < 24 && days >= 0
}

method AdvanceStopwatch(
  seconds: int, minutes: int, hours: int, days: int,
  advance_by: int
) returns (new_seconds: int, new_minutes: int, new_hours: int, new_days: int)
  requires stopwatch_invariant(seconds, minutes, hours, days)
  ensures stopwatch_invariant(new_seconds, new_minutes, new_hours, new_days)
  ensures calc_seconds(new_seconds, new_minutes, new_hours, new_days)
       == calc_seconds(seconds, minutes, hours, days) + advance_by
  // TODO: delete the following line and implement the function
  requires false
{
  // TODO
}

/*
  4. Uncomment the following tests to make sure that
  your implementations are working.
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

  // var s, m, h, d := AdvanceStopwatch(0, 0, 0, 0, 65);
  // assert s == 5 && m == 1 && h == 0 && d == 0;
}
