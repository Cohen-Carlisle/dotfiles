alias be='bundle exec'

mfdiff() {
  cat $1 |
  mix format - |
  diff --unified --color=always $1 - |
  less --raw-control-chars --quit-if-one-screen --no-init
}

edex() {
  local dir=$(exercism download --uuid=$1)
  echo $dir
  cd $dir
  sed -i -- 's/^  @tag :pending/  # @tag :pending/g' test/*_test.exs
  mix test
}

touchp() {
  mkdir -p $( dirname "$1" )
  touch "$1"
}
