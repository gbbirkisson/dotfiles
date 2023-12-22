RTX_BIN=$(which rtx)
rtx() {
	PATH="$(dirname $(${RTX_BIN} which direnv)):$PATH" direnv_load ${RTX_BIN} direnv exec
}
