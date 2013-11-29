# bash Cheatsheet

## Find files by extension<sup>1</sup>

    find . -name "*.txt" -type f

## Find and remove files by extension<sup>2</sup>

    find . -name "*.txt" -type f -delete

## Find empty directories<sup>3</sup>

    find . -depth -empty -type d

## Find and remove empty directories<sup>3</sup>

    find . -depth -empty -type d -delete

## References

### Footnotes / Links

1. http://stackoverflow.com/a/7096538/709769
2. http://stackoverflow.com/a/20294831/709769
3. http://stackoverflow.com/a/2811135/709769
