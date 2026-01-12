# set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

# Set JAVA_HOME in ENV
if [[ -f /usr/bin/java ]]; then
    JAVA_HOME="$(readlink -f /usr/bin/java | sed "s:bin/java$::")"
    export JAVA_HOME
    # export PATH="$PATH":"$JAVA_HOME"/bin
fi

if [[ -f /usr/local/bin/apache-maven ]]; then
    export M2_HOME="/usr/local/bin/apache-maven"
    export PATH="$PATH:$M2_HOME/bin"
fi

if [[ -f /usr/local/bin/gradle ]]; then
    export GRADLE_HOME="/usr/local/bin/gradle"
    export PATH="$PATH:$GRADLE_HOME/bin"
fi

# Android Studio
if [[ -f /usr/local/java/android-studio/bin ]]; then
    export ANDROID_HOME=/usr/local/java/android-stodio/bin
    export PATH=$PATH:$ANDROID_HOME
fi

# Android SDK
if [[ -f /home/usr/Android/Sdk ]]; then
    export ANDROID_SDK_HOME=/home/user/Android/Sdk
    export PATH=$PATH:$ANDROID_SDK_HOME/platform-tools
fi

# Use plain style for man pages
if [[ -n $(command -v bat) ]]; then
    export MANPAGER="bat --language man --style=plain"
    export PAGER="bat --style=plain"
fi

export GREP_OPTIONS="--color=auto -nrI --exclude-dir=\.git --exclude-dir=\.svn --exclude=*.pyc --exclude=tags"
