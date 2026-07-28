 This command converts files that should be pointers but aren't.
 It makes a new commit for the change, and doesn't rewrite history.

```
 git lfs migrate import --no-rewrite -m "Converting to lfs pointers" path1 path2 ...
```
