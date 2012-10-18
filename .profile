test -z "${PROFILEREAD}" || return

__prompt_user_color="38;5;242"
__prompt_host_color="38;5;141"
__prompt_path_color="38;5;135"
__prompt_repo_color="38;5;238"
__prompt_info_color="38;5;238"
__prompt_sep_color="38;5;238"

__archive_color="38;5;202"
__image_color="38;5;115"
__video_color="38;5;116"
__audio_color="38;5;117"
__document_color="38;5;111"

__sourcecode_c_color="38;5;201"
__sourcecode_java_color="38;5;206"
__sourcecode_php_color="38;5;211"

__master_icon=→
__branch_icon=↳
__detach_icon=✗

__status_conflict_icon=⚠
__status_addrm_icon=±
__status_add_icon=⁺
__status_rm_icon=₋
__status_unknown_icon=⁇

for dotfile in .aliases .ls ; do
  if test -f "${HOME}/${dotfile}" ; then
    . "${HOME}/${dotfile}"
  fi
done

export PROMPT_DIRTRIM="2"
export PROMPT_COMMAND="__prompt"

__git_repo () {
  git config --get remote.origin.url 2>/dev/null
}
__git_info () {
  local branch="`git branch 2>/dev/null | sed 's/^[*] \(.*\)/\1/p;d'`"
  local status="`git status -s 2>/dev/null | sed 's/^\([ ?A-Z][ ?A-Z]\) .*/\1/p;d' | sort -u`"
  local output=""

  test -z "${branch}" -a -z "${status}" && return

  case "${branch}" in
    "(no branch)") output="${__detach_icon} detached head" ;;
    "master")      output="${__master_icon} ${branch}" ;;
    "")            output="" ;;
    *)             output="${__branch_icon} ${branch}" ;;
  esac
  case "${status}" in
    *UU*)    output="${output}${__status_conflict_icon}" ;;
    *A*D*M*) output="${output}${__status_addrm_icon}" ;;
    *A*D*)   output="${output}${__status_addrm_icon}" ;;
    *A*M*)   output="${output}${__status_add_icon}" ;;
    *D*M*)   output="${output}${__status_rm_icon}" ;;
    *A*)     output="${output}${__status_add_icon}" ;;
    *D*)     output="${output}${__status_rm_icon}" ;;
    *M*)     output="${output}${__status_add_icon}" ;;
    *??*)    output="${output}${__status_unknown_icon}" ;;
  esac

  echo ${output}
}

__cvs_repo () {
  cat CVS/Root 2>/dev/null
}
__cvs_info () {
  :
}

__svn_repo () {
  svn info 2>/dev/null | sed 's/^URL: \(.*\)\/trunk.*$/\1/p;
                              s/^URL: \(.*\)\/tags\/.*$/\1/p;
                              s/^URL: \(.*\)\/branches\/.*$/\1/p;d'
  return "${PIPESTATUS[0]}"
}
__svn_info () {
  local branch="`svn info 2>/dev/null | sed 's/^URL: .*\/trunk.*$/trunk/p;
                                             s/^URL: .*\/tags\/\([^\/]*\).*/t\1/p;
                                             s/^URL: .*\/branches\/\([^\/]*\).*/b\1/p;d'`"
  local status="`svn status 2>/dev/null | sed 's/^\([?A-Z]\)[ \t].*$/\1/p;d' | sort -u`"
  local output=""

  test -z "${branch}" -a -z "${status}" && return

  case "${branch}" in
    "trunk") output="${__master_icon} ${branch}" ;;
    "t"*)    output="${__detach_icon} ${branch#t}" ;;
    "b"*)    output="${__branch_icon} ${branch#b}" ;;
  esac
  case "${status}" in
    *C*)     output="${output}${__status_conflict_icon}" ;;
    *A*D*M*) output="${output}${__status_addrm_icon}" ;;
    *A*D*)   output="${output}${__status_addrm_icon}" ;;
    *A*M*)   output="${output}${__status_add_icon}" ;;
    *D*M*)   output="${output}${__status_rm_icon}" ;;
    *A*)     output="${output}${__status_add_icon}" ;;
    *D*)     output="${output}${__status_rm_icon}" ;;
    *M*)     output="${output}${__status_add_icon}" ;;
    *?*)     output="${output}${__status_unknown_icon}" ;;
  esac

  echo ${output}
}

__prompt () {
  PROMPT_OLD_REPO="${PROMPT_REPO}"

  for PROMPT_SCM in git svn ; do
    PROMPT_REPO="`__${PROMPT_SCM}_repo`" && break
  done

  if ! test "${PROMPT_REPO}" = "${PROMPT_OLD_REPO}"; then
    if test -n "${PROMPT_REPO}" ; then
      echo -e "\033[${__prompt_repo_color}morigin: ${PROMPT_REPO}\033[0m"
      PROMPT_INFO="`__${PROMPT_SCM}_info`"
      PROMPT_INFO="\[\033[${__prompt_info_color}m\] ${PROMPT_INFO}"
    else
      PROMPT_INFO=""
    fi
  fi

  local sepc="\[\033[0m\033[${__prompt_sep_color}m\]"
  local reset="\[\033[0m\]"
  local user="\[\033[0m\033[${__prompt_user_color}m\]\u"
  local host="\[\033[${__prompt_host_color}m\]\h"
  local path="\[\033[${__prompt_path_color}m\]\W"

  PS1="${user}${sepc}@${host}${sepc}:${path}${PROMPT_INFO}${sepc} \$ ${reset}"
  PS2="${sepc} > ${reset}"
}

export COLUMNS

