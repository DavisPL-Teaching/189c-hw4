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

This one is also tricky! You will need to first implement the
function, then verify it using a loop invariant.

For the implementation part:
it is a standard binary search; if you need to review, I recommend looking
up the pseudocode for binary search online. For example, on
[Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm#Algorithm).

For the proof and loop invariant:
your implementations may vary, but your loop probably has a "lower" and an "upper"
value that you know the target is between.
The general rule is for any variables that are modified by the
loop, you need a loop invariant that tells you what properties
those variables satisfy.

For example, your loop invariant might need some things like:
   - the function evaluated at the lower bound is less than the target; and
   - the function evaluated at the upper bound is greater than or equal to the target.
Also, note that the for a correct binary search implementation,
the lower bound is always less than the upper bound, and that both of these are in range of the (min_value, max_value) bounds specified in the input.
If you have a `mid` or `pivot` variable in your loop, you may need
similar constraints on the mid value.

## 2: constructor

Every method will need to use the class invariant as a precondition
and postcondition, but for the constructor, it only needs a
postcondition.

You will need an additional postcondition that the object is
initialized correclty; you may find as_seconds() useful here.

## 2: Tick

You will need to use the `old` keyword for the postcondition.
You can also wrap a function invocation in `old`, for example:

```
old(as_seconds())
```

## 2: AdvanceBy

If you use a loop, your loop invariant
can refer to old(...) as in the postcondition to Tick.
You may also need to repeat the class invariant as a loop invariant.

## 3.1

Return values are mutable in Dafny, so the value `root` is mutable
if you want to use it in your implementation.

Since you are searching for the smallest integer `root` such that
something holds, try a loop invariant of the form
`root * root < (something)`.

## 3.2

You will need to use the `pow()` function in your invariant.
The loop invariant here is similar to 3.1.

## 3.3

You can add an element to a sequence a like this:
```
a := a + [element];
```

You can refer to all elements of a sequence in an invariant like
this:
```
invariant forall j :: (0 <= j < |a|) ==> (some condition on a)
```

## 3.4

In my implementation, I needed two lemmas.
One of them, `ArraySliceLemma` says that
```
a[..(i + 1)] == a[..i] + [a[i]]
```

The other one, `ArraySumLemma` states that a similar property to the above holds for array_sum.
Here's my proof (implementation) for `ArraySumLemma`:
```
{
  if |a| == 0 {
  } else {
    ArraySliceLemma(a);
  }
}
```
