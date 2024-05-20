# Homework 4: Dafny

## Due date: Monday, June 3

You have 2 weeks to complete this homework.
We recommend getting started early! That way you can take
advantage of office hours and Piazza to ask questions.

## Getting started

For this homework, you will need to have VSCode
and the Dafny VSCode extension installed.
Please see the installation instructions below.
(Note: you won't need to run Dafny from the command line
to complete this homework. The instructions for adding
Dafny to your path are also included but are totally optional.)

Similar to HW1 and HW2, there are three parts to this assignment.
- Part 1 is a series of mini exercises.
- Part 2 is about classes and class invariants.
- Part 3 is about writing verified code with loop invariants.

As with HW1-HW3, the assignment will be submitted through GitHub Classroom. For detailed instructions, see [this Piazza post](https://piazza.com/class/lt90i40zrot3ue/post/48).

To continue, open and edit the files `part1.dfy`, `part2.dfy`, and `part3.dfy`.

## Getting help

If you get stuck, take a look at the file `hints.md` for some hints.
I have also found the [Dafny tutorial](https://dafny.org/dafny/OnlineTutorial/guide.html)
and [Dafny cheatsheet](https://dafny.org/latest/DafnyCheatsheet.pdf)
to be super helpful.

Please also don't hesitate to ask questions on Piazza or drop by
office hours!

## Installation

### Mac

If you are on Mac, [Homework 0](https://github.com/DavisPL-Teaching/189c-hw0) had the correct instructions:
```
brew install dotnet
brew install dafny
```
Then, in VSCode, install the Dafny extension -- link here:
https://marketplace.visualstudio.com/items?itemName=dafny-lang.ide-vscode

Check that the green bars are showing up on the side in VSCode.
If they are not, you may need to refresh the file or restart VSCode.
You can also run `dafny --version` to check if the Dafny command
line is working.

### GitHub Codespaces, Windows, or Linux

Install VSCode, then install the VSCode extension via
the link above.
In most cases, this should work out of the box!
Open up a Dafny file and wait for the extension to prompt
you to confirm installing Dafny 4.6.0.

On Codespaces only:
If you're getting an "unable to connect" error when
opening the codespace, try switching browsers - I have been
encountering this error in Firefox, but not on Safari.

On Linux only:
It's possible that before running the VSCode extension, you may need to
run `sudo apt install dotnet-sdk-6.0` to install dotnet.

As in the Mac instructions,
make sure that the green bars are showing up in VSCode.
If so, you are good to go!

## Troubleshooting the installation

If you are having any trouble after following the installation instructions above,
please let us know by making a post on Piazza and we will try to help
you! See
[this post](https://piazza.com/class/lt90i40zrot3ue/post/28)
for Piazza guidelines about posting errors.
If the instructions are not working locally on your machine,
try running Dafny in a codespace via the instructions above.

----

## OPTIONAL: Installing the Dafny command line

**The remainder of this file is totally optional.**
You can skip it if you want to only use Dafny from VSCode.

Once the green checkmarks show up, that means Dafny is installed!
That means, there is a `dafny` binary or `Dafny.exe` somewhere
on your system.
If you are on Mac, the command line will already be installed
via `brew`.
On other platforms,
to be able to use `dafny` on the command line,
we neeed to add `dafny` to your PATH.

The easiest way to find the path to Dafny is by looking at
the output when Dafny is installed in VSCode, you should see
a line in the output like this:
```
extracting Dafny to /home/codespace/.vscode-remote/extensions/dafny-lang.ide-vscode-3.3.0/out/resources/4.6.0/github
```
Copy the above path and add `/dafny` at the end, and run the
following command (on Windows, this only works in WSL or a linux-style
shell):
```
export PATH=$PATH:/home/vscode/.vscode-remote/extensions/dafny-lang.ide-vscode-3.3.0/out/resources/4.6.0/github/dafny
```

You can also call the dafny executable directly,
it's `<path above>/dafny` or `<path>\Dafny.exe` on Windows.
For example on Windows you can just use:
```
C:\Users\user_name\.vscode\extensions\dafny-lang.ide-vscode-3.3.0\out\resources\3.10.0\github\dafny\Dafny.exe --version
```
For the command line, run `dafny --version` (or `<full_path>\Dafny.exe --version` on Windows), you should get something like:
```
4.6.0
```
or:
```
4.6.0+7c82175da631d3fdc3acea92a3614d66a3fdf7f2
```
You can also run `dafny run file.dfy` on a particular file `file.dfy`
and Dafny should verify and run the file.

### Additional ways to get the PATH (optional)

The easiest way to get the PATH is by checking the dafny output
when the extension is first installed (see above).
However, if you want to find the path to Dafny directly with a
command, here's how you can do that:

On Linux or Codespaces: run this:
```
find /home -type d -name dafny
```

The output should be something like
```
/home/codespace/.vscode-remote/extensions/dafny-lang.ide-vscode-3.3.0/out/resources/4.6.0/github/dafny
```

which you can add to your path directly:
```
export PATH=$PATH:/home/vscode/.vscode-remote/extensions/dafny-lang.ide-vscode-3.3.0/out/resources/4.6.0/github/dafny
```

On Windows, I recommend using WSL or another linux-style shell
so that the above commands work.
The default terminal in VScode is Powershell.
Although Powershell is not recommended, you can also get the path
and run dafny from Powershell:
```
Get-ChildItem C:\Users\<username> -Recurse | Where-Object { $_.Name -like "Dafny.exe" }
```
Output example:
```
C:\Users\user_name\.vscode\extensions\dafny-lang.ide-vscode-3.3.0\out\resources\3.10.0\github\dafny\Dafny.exe
```

That's where your `Dafny.exe` is! You can use it by specifying
the full path or add it to your PATH first.
