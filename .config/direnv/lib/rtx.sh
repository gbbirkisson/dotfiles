RTX_BIN=$(which rtx)
rtx() {
	direnv_load ${RTX_BIN} direnv exec
}
