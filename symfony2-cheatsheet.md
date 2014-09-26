# symfony2 Cheatsheet

## Setup

### Install assets as symlink<sup>1</sup>

Add the following line to the 'extra'-section nn composer.json:

    "extra": {
        [...]
        "symfony-assets-install": "symlink"
    }

### Move sessions outside cache-folder<sup>2</sup>

    # app/config/config.yml
    framework:
        session:
            handler_id: session.handler.native_file
            save_path: "%kernel.root_dir%/sessions"

### Set permissions<sup>3</sup>

    rm -rf app/cache/ app/logs/ app/sessions/
    
    HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
    sudo chmod +a "$HTTPDUSER allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs app/sessions
    sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs app/sessions

## References

### Footnotes / Links

1. http://symfony.com/doc/current/book/installation.html#updating-vendors
2. http://symfony.com/doc/current/cookbook/session/sessions_directory.html
3. http://symfony.com/doc/current/book/installation.html#configuration-and-setup
