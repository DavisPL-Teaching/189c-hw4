# HW4 Selected Hints

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

This is tricky.
Dafny sees only that result1 + result2 == s,
and the two halves are equal, but it's having trouble inferring
from that that result1 must be the first part of s
(and not some other random string).
Two ways to do it:

1. Add an intermediate assertion.
   The assertion should go right before the assertion on
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
   an additional line such as
   ```
   ensures result1[...] == s[...]
   ```
   where the `...` parts are chosen appropriately to help the proof go through.

## 1.14

There are lots of ways to do this one! Just pick a few different ways.
The implementations should be "different" in the sense that they differ
for at least some inputs (not necessarily all inputs).

## 1.15

You will need to first implement the
function, then verify it using a loop invariant.
It is a standard binary search; if you need to review, I recommend looking
up the pseudocode for binary search online. For example, on
[Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm#Algorithm).

## 2.3

Every method will need to use the class invariant as a precondition
and postcondition, but for the constructor, it only needs a
postcondition.

You will need an additional postcondition that the object is
initialized correclty; you may find as_seconds() useful here.

## 2.4

You will need to use the `old` keyword for the postcondition.
You can also wrap a function invocation in `old`, for example:

```
old(as_seconds())
```

## 2.6

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

## 3.3

One way to add an element to a sequence is like this:
```
a := a + [element];
```

For examples of invariants on arrays/sequences, please review the class notes.

## 3.4

In my implementation, I needed two lemmas.
You should expermient with your code by adding assertions to figure out what Dafny knows and what it doesn't know about your input sequence.

The first of my lemmas was a lemma about expressions of the form `a[..(i + 1)]`, and the second was about how `array_sum` behaves on an expression of this form.
(Note that it is also possible to do it with only one lemma, and not two.)
