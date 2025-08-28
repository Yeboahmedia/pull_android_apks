# fish completion for pull-apk
complete -c pull-apk -s p -l package -d "Package name" -a "(pull-apk --_comp-list-packages ^/dev/null)"
complete -c pull-apk -s a -l app     -d "Search term"  -a "(pull-apk --_comp-list-packages ^/dev/null)"
complete -c pull-apk -s d -l decompile  -d "Decompile with apktool"
complete -c pull-apk -s j -l jadx       -d "Open with jadx-gui"
complete -c pull-apk     -l check-deps  -d "Show dependency status"
complete -c pull-apk -s v -l version    -d "Print version"
complete -c pull-apk -s h -l help       -d "Show help"
