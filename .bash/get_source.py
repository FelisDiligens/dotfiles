#!/usr/bin/env python3

import os
import sys
from pathlib import Path

# Only run when directly executed
if __name__ == "__main__":
    dry_run = len(sys.argv) == 2 and sys.argv[1] == "--dry-run"
    script = ""

    # Look into the ~/.bash folder:
    for filename in sorted(os.listdir(Path.home() / ".bash")):
        filepath = Path.home() / ".bash" / filename
        # Only look at files that start with .bash_ or end with .sh:
        if filepath.is_file() and (filename.startswith(".bash_") or filename.endswith(".sh")):
            if dry_run:
                print(filepath)
            else:
                # Write their content into temp variable:
                with open(filepath, "r") as f:
                    script += f"# {filename}\n{f.read()}\n"

    # Print out the content of all scripts:
    if not dry_run:
        print(script)