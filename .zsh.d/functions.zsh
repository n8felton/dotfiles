function localip(){
  if [[ "${OSTYPE}" =~ ^linux ]]; then
    ip -4 -o addr show $(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $5}') |\
    egrep -o "([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}" |\
    head -n 1
  elif [[ "${OSTYPE}" =~ ^darwin ]]; then # macOS
    ifconfig | awk '{if($1=="inet" && $5=="broadcast") {print $2}}'
    ifconfig | awk '{if($1=="inet6" && $6=="secured") {print $2}}'
  fi
}

function chaincheck () {
  openssl s_client -verify 5 -quiet -connect $1 2>&1 < /dev/null | awk -F'=' '/CN/ {print $NF}'
}

function smbpath () {
  sed 's#\\#/#g' <<< "$1"
}

function dig-answer () { dig +noall +noclass +nottlid +answer "${@}" | column -t } 

function cppb { echo -n "${PWD}/${1}" | pbcopy }
