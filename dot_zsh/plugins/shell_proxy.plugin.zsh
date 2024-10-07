#### terminal proxy setting functions
set_proxy() {
  echo "Proxy config have set."
  export http_proxy=http://127.0.0.1:7890 
  export https_proxy=http://127.0.0.1:7890
  export ALL_PROXY=socks5://127.0.0.1:7890
}

unset_proxy() {
  unset http_proxy
  unset https_proxy
  unset ALL_PROXY
}

set_proxy
