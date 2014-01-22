# bash Cheatsheet

## Files and Directories

### Recursively find files by extension<sup>1</sup>

    find . -name "*.txt" -type f

### Recursively find and remove files by extension<sup>2</sup>

    find . -name "*.txt" -type f -delete

### Recursively find empty directories<sup>3</sup>

    find . -depth -empty -type d

### Recursively find and remove empty directories<sup>3</sup>

    find . -depth -empty -type d -delete

### Recursively change permissions for files, ignore directories<sup>4</sup>

    find . -type f -exec chmod 644 {} \;

### Recursively change permissions for directories, ignore files

    find . -type d -exec chmod 755 {} \;

### List all file extensions in a directory (including subfolders)<sup>5</sup>

    find . -type f | grep -o '\.[^./]*$' | sort | uniq

or

    find . -name '*.*' -type f | sed 's@.*/.*\.@.@' | sort | uniq

## Misc.

### Open a URL from commandline<sup>6</sup>

    open -a Firefox 'http://madcity.at'

## References

### Footnotes / Links

1. http://stackoverflow.com/a/7096538/709769
2. http://stackoverflow.com/a/20294831/709769
3. http://stackoverflow.com/a/2811135/709769
4. http://www.commandlinefu.com/commands/view/1981
5. http://www.commandlinefu.com/commands/view/6308
6. http://stackoverflow.com/a/10866637/709769
