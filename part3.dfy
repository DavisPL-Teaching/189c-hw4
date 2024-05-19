/*
  Part 3: sorting algorithms

  In the final part, you will implement merge sort.

  ===== Grading requirements =====

  Your code should pass the Dafny verifier:
    dafny part2.dfy
  should pass with every function verified, no errors.
  You can also simply check that the green bar shows up next
  to every function in VSCode, throughout the whole file,
  with no errors (shown in red).
*/

method MergeSort(l: seq<int>) returns (result: seq<int>)
  requires false
  ensures forall i, j | 0 <= i <= j < |l| :: l[i] <= l[j]
{
  // TODO
}
