/*
  Part 2: Classes and class invariants

  This part is an introduction to classes and class invariants
  in Dafny, through implementing a simple stopwatch class.

  ===== What is a class invariant? =====

  A class invariant is a condition that should always be true
  - after the constructor is called, and
  - at every *entry* and *exit* point of every method or function of a class.

  In other words, it is the same thing as a precondition and postcondition
  on every method of the class.

  ===== How do classes work in Dafny? =====

  Most of the syntax here should be familiar from the lectures and part 1.
  The new syntax is as follows:
  - the "reads" clause indicates that a function reads the state of the object
    in a particular variable. (e.g. `reads x` to read the variable x.)
  - the "modifies" clause indicates that a method modifies the state of the object.
    You can just say "modifies this" to indicate that the object itself is modified.
  - You can use the "this" keyword to refer to the object, however, this is not
    usually necessary as just referring to the field name will also work.

  Note: "reads" is only used for functions, and "modifies" is only used for methods.

  Also:
  - the old(value) function is useful in postconditions! It allows you to refer
    to the value of a variable before the method was called. For example, to say
    that seconds is not modified by a method, you would say
      `ensures seconds == old(seconds)`
    However this is only necessary if the method `modifies` the variable, it should
    not be necessary if the method only `reads` the variable.

  ===== Your Task =====

  The stopwatch consists of four fields: seconds, minutes, hours, and days.
  You will first implement a class invariant that should ensure that the time is always
  valid (the meaning of "valid" is described above the class invariant).
  Then you will implement all of the methods below.
  The constructor is written for you, but it needs a postcondition.

  To check that your implementation is working, there is a Tests() method at the end
  of the file.

  ===== Just for fun =====

  There's an excellent list called "falsehoods programmers believe about time":
  https://gist.github.com/timvisee/fcda9bbdff88d45cc9061606b4b923ca

  Since our stopwatch is not concerned with things like leap seconds
  and time zones, fortunately, we can ignore these falsehoods for
  the purpose of this exercise.
  But it might be fun (as a larger project) to write a real time module in
  a verified language like Dafny and try to prove or disprove some of these falsehoods
  given a sufficiently detailed model of time.

  ===== Grading notes =====

  - Your file should pass the Dafny verifier with no errors or warnings.
    Look for the green bars on the left or
    (if you have the command line): `dafny verify part2.dfy` should output
    ```
    Dafny program verifier finished with <n> verified, 0 errors
    ```

  - Your test cases in Tests() should cover at least one case for each method.

  - The implementation of all methods should
    match the description given above the method.
    (This is most important for `class_invariant` and `as_seconds`.)

  - Ensure that you implement *both* the preconditions and postconditions for
    each methods, and that the class invariant is mentioned
    in the pre and postconditions of each method.
*/

class Stopwatch
  {

  var seconds: int
  var minutes: int
  var hours: int
  var days: int

  /*
    1. Class invariant

    The stopwatch should ensure that the time is always valid,
    i.e., when seconds gets to 60, it should wrap over to 0 and minutes should
    go up by 1, and similarly for minutes or hours. "days" is just a counter that
    can be arbitrarily large.

    Additionally, none of the time values should ever be negative.
  */
  // TODO: Uncomment and implement
  // function class_invariant(): bool
  //   reads this
  // {
  // }

  /*
    2. Convert the stopwatch to a total number of seconds.

    This is a function as it does not modify the state of the object,
    so it doesn't need a pre or postcondition.
  */
  // TODO: Uncomment and implement
  // function as_seconds(): int
  //   reads this
  // {
  // }

  /*
    3. Constructor

    Initializes the stopwatch to 0.
  */
  constructor ()
    // TODO: add postconditions
    // ensures ...
  {
    seconds := 0;
    minutes := 0;
    hours := 0;
    days := 0;
  }

  /*
    4. Add 1 second to the stopwatch.
  */
  method Tick()
    modifies this
    // TODO: add pre and postconditions
  {
    // TODO: Implement the method
  }

  /*
    5. Reset the stopwatch to 0 (for all counters).
  */
  method Reset()
    modifies this
    // TODO: add pre and postconditions
  {
    // TODO: Implement the method
  }

  /*
    6. Advance the stopwatch by an arbitrary number of seconds.
    The number to advance by should be nonnegative!

    This should be equivalent to calling Tick() repeatedly
    `inc` times.
    You may implement it however you like, but if you want a challenge,
    try calling Tick() in a loop and coming up with the loop invariant.
  */
  method AdvanceBy(inc: int)
    modifies this
    // TODO: add pre and postconditions
  {
    // TODO: Implement the method
  }
}

/*
  7. Test your stopwatch here.

  Add at least one test case for each method.
*/
method Tests()
{
  var sw := new Stopwatch();

  // Test the class_invariant() function

  // Test the as_seconds() function

  // Test the constructor

  // Test the Tick() method

  // Test the Reset() method

  // Test the AdvanceBy() method
}

/*
  8. Comment on the following questions:

  Does abstracting pre/postconditions in
  a class invariant help make verification
  easier, harder, or equally as difficult
  as if classes (objects) were not available?

  Are classes and object-oriented programming necessary
  for a practical, real-world verification language?

  ===== ANSWER Q8 BELOW =====

  ===== END OF Q8 ANSWER =====
*/
