bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# last command should be recalled and cursor would go in the beginning, ready to edit it.

recall_last_command() {
    BUFFER=" $_"
    CURSOR=0
}
zle -N recall_last_command
bindkey -M vicmd 'b' recall_last_command


# History Settings (big history for use with many open shells and no dups)
# Different History files for root and standard user
if (( ! EUID )); then
    HISTFILE=/root/.zsh_history
else
    HISTFILE=~/.zsh_history
fi
SAVEHIST=100000
HISTSIZE=120000
setopt share_history append_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space

# 2x control is completion from history!!!
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey '^X^X' hist-complete

# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Treat  the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.  (An initial unquoted ‘~’ always produces named directory expansion.)
setopt EXTENDED_GLOB

# If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument  list. This also applies to file expansion of an initial ‘~’ or ‘=’.
setopt NOMATCH

# no Beep on error in ZLE.
setopt NO_BEEP

# Remove  any right prompt from display when accepting a command line. This may be useful with terminals with other cut/paste methods.
setopt TRANSIENT_RPROMPT

# If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
setopt COMPLETE_IN_WORD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# DON NOT Allow ‘>’ redirection to truncate existing files, and ‘>>’ to create files. Otherwise ‘>!’ or ‘>|’ must be used to truncate  a file, and ‘>>!’ or ‘>>|’ to create a file.
setopt no_clobber
