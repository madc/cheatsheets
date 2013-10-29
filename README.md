# macports Cheatsheet

## List ports

### List of installed MacPorts (without dependencies)<sup>[1]</sup>

    port installed requested

## Cleanup ports

### Remove build files<sup>2</sup>

    port clean --all all

### Uninstall inactive ports<sup>2</sup>

    sudo port -f uninstall inactive

### Uninstall unused dependencies<sup>3</sup>

    sudo port install port_cutleaves
    sudo port_cutleaves

The second command can be run repeatedly. It also removes dependencies, that are used to build ports.
These dependencies might be re-installed on install or upgrade of a port.

## Footnotes / Links

1. http://stackoverflow.com/a/15050762/709769
2. http://superuser.com/a/165670/265044
3. http://www.jbmurphy.com/2011/02/17/my-mac-ports-cheat-sheet/
