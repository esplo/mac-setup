function npm
    command npm $argv
    if test -d node_modules
        xattr -w com.dropbox.ignored 1 node_modules
    end
end
