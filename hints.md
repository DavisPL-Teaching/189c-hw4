# HW4 Hints

## 1.7

The precondition should be the "x is positive" part.
The assertion should be the "max(x, y) is positive" part.

## 1.8

The counterexample feature is experimental, so it can be
a bit rough around the edges (for example it generates errors if you
keep editing the file as counterexamples are running).
If the feature isn't working, you're welcome to just list out some
counterexamples by hand!

## 1.9

This version assumes that |result1| == |result2|, i.e. the two
halves are exactly the same length. What does that imply about the input?

## 1.10

It may help to compare this version to the Python version we saw in HW1:
```
    if len(s) > n:
        return None
    return s + " " * (n - len(s))
```

Compared to that version, this version never returns None.
What does that imply about the input?

## 1.12

This one is tricky :)
Even if a property is true, sometimes the verification tool just
doesn't have enough information to prove it.

Dafny sees only that result1 + result2 == s,
and the two halves are equal, but it's having trouble inferring
from that that result1 must be the first part of s
(and not some other random string).
Two ways to do it:

1. Add an intermediate assertion of the form s[..mid] == result1 where mid is chosen
   appropriately. The assertion should go right before the assertion on
   the result of the function, for example:
   ```
   var s:= /* your example */
   var result1, result2 := SplitInHalf(s);
   /* Add your intermediate assertion here */
   assert result1 == /* first half */;
   assert result2 == /* second half */;
   ```

2. It's also possible to fix this by adding an additional -- but redundant
   -- postcondition to SplitInHalf that basically adds the assertion that
   you want to make above. Don't remove the existing postcondition, but add
   an additional line like:
   ```
   ensures result1[..(mid)] == s[..(mid)]
   ```
   where again, `mid` is an expression that is chosen appropriately.

## 1.13

Some examples:
- if a == 4 and b == 5, then there would be no way to pick a value
  `result` between 4 and 5.
- Similarly if a == 4 and b is anything less than 4, then it would be impossible.
- But if a == 4 and b >= 6, then it is possible as there is at least one
  value between 4 and 6.

## 1.14

There are lots of ways to do this one! Just pick a few different ways.
The implementations should be "different" in the sense that they differ
for at least some inputs (not necessarily all inputs).
For example, just doing a + 2 + 1 is not different from a + 3.

It's possible to implement 3 different ways without if statements, but if you're
stuck, you can use an if statement (like if a is even, ... for example).

## 1.15

For the implementation part:
This is a standard binary search; if you need to review, I recommend looking
up the pseudocode for binary search online. For example, on
[Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm#Algorithm).

For the proof part:
Your function will have a loop!
So the hard part is determining the loop invariant.

Your implementations may vary, but your loop probably has a "lower" and an "upper"
value that you know the target is between. So you might need a loop invariant like:
   - the function evaluated at the lower bound is less than the target; and
   - the function evaluated at the upper bound is greater than or equal to the target.
Also, you will need that the lower bound is less than the upper bound, and that
both of these are in range of the (min_value, max_value) bounds specified in the input.
This has to be asserted as part of the invariant since the lower/upper bounds change
on each iteration of the loop.
