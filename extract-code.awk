# https://alvinalexander.com/source-code/awk-script-extract-source-code-blocks-markdown-files/

BEGIN {
    true = 1
    false = 0
    printLine = false
}

{
    if ($0 ~ /^```bash #x/) {
        printLine = true
    } else if ($0 ~ /^```[:space:]*$/) {
        printLine = false
    } else {
        if (printLine) print $0
    }
}