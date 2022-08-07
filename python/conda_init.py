#!/usr/bin/python3
"""Extract the new lines from `conda init -v --dry-run zsh` and print"""
import re
import sys

input_text = "".join(sys.stdin)
pattern=(
    r"^\+# >>> conda initialize >>>$"
    r"(.|\n)*"
    r"^\+# <<< conda initialize <<<$"
)
match = re.search(pattern, input_text, re.MULTILINE)
new_lines = match.group(0).splitlines()
for line in match.group(0).splitlines():
    print(line[1:])

