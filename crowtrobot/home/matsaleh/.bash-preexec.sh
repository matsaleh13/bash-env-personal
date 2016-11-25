# Install functions to exec before and after commands are executed.
# See /etc/bash_preexec, sourced by /etc/bash.bashrc


#log_command() {
#}

#preexec_functions+=(log_command)


log_result() {
  _LAST_RESULT="$?"
  # Exclude these commands
  case "${__el_LAST_EXECUTED_COMMAND}" in 
      ls*|cd*)
          ;;
      *)
          if [[ ! -z "${__el_LAST_EXECUTED_COMMAND}" ]]; then
            echo "$(print_timestamp) ${__el_LAST_EXECUTED_COMMAND}"
            echo "  ===> ${_LAST_RESULT}"
          fi 
          ;;
  esac
}

precmd_functions+=(log_result)
