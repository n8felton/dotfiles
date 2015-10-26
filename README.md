### Easy Download

<pre><code>cd ~ && curl -Lk# https://github.com/n8felton/dotfiles/tarball/master | tar --strip-components 1 -xz && source .bash_profile</code></pre>

Load dotfiles into default profile. Useful with DeployStudio workflow.

<pre>
#!/bin/sh

bash -c 'curl -Lk# https://github.com/n8felton/dotfiles/tarball/master | tar --strip-components 1 -xC /System/Library/User\ Template/Non_localized/'
</pre>
